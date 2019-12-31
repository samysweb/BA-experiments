#! /bin/bash

exec 6>&1 7>&2

exec &> $LOG_DIR/machine-$JOB_ID.log
echo "******* Machine details *******"
echo "$ hostname"
hostname
echo "$ lscpu"
lscpu
echo "$ cat /proc/meminfo"
cat /proc/meminfo
echo "$ cat /proc/version"
cat /proc/version
echo "$ lsblk"
lsblk

exec 1>&6 2>&7 6>&- 7>&-

IFS=':' read -ra BENCHMARKS <<< $(cat $FILES)
#for bench in "${BENCHMARKS[@]}"; do
#    echo "[runner] $BENCHMARK_PATH/$bench"
#    runlim -r $TO -s $MEM $BIN $ARGS $BENCHMARK_PATH/$bench
#done
if [ $PAR_NUM = 1 ]; then
    for bench in ${BENCHMARKS[@]}; do
        TO=$TO MEM=$MEM BIN=$BIN ARGS=$ARGS PAR_NUM=$PAR_NUM $EXPERIMENT_DIR/run.sh "$BENCHMARK_PATH/$bench"
    done
else
    TO=$TO MEM=$MEM BIN=$BIN ARGS=$ARGS PAR_NUM=$PAR_NUM $PARALLEL_PATH -j$PAR_NUM $EXPERIMENT_DIR/run.sh ::: "${BENCHMARKS[@]/#/$BENCHMARK_PATH/}"
fi
rm $FILES
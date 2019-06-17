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

IFS=':' read -ra BENCHMARKS <<< "$FILES"
#for bench in "${BENCHMARKS[@]}"; do
#    echo "[runner] $BENCHMARK_PATH/$bench"
#    runlim -r $TO -s $MEM $BIN $ARGS $BENCHMARK_PATH/$bench
#done
TO=$TO MEM=$MEM BIN=$BIN ARGS=$ARGS $PARALLEL_PATH -j1 $EXPERIMENT_DIR/run.sh ::: "${BENCHMARKS[@]/#/$BENCHMARK_PATH/}"
#! /bin/bash

source $EXPERIMENT_DIR/init.sh
IFS=':' read -ra BENCHMARKS <<< "$FILES"
#for bench in "${BENCHMARKS[@]}"; do
#    echo "[runner] $BENCHMARK_PATH/$bench"
#    runlim -r $TO -s $MEM $BIN $ARGS $BENCHMARK_PATH/$bench
#done
TO=$TO MEM=$MEM BIN=$BIN ARGS=$ARGS $PARALLEL_PATH -j4 $EXPERIMENT_DIR/run.sh ::: "${BENCHMARKS[@]/#/$BENCHMARK_PATH/}"
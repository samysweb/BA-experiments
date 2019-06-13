#! /bin/bash

source $VARIABLES

source $EXPERIMENT_DIR/init.sh

mkdir -p $LOG_DIR

VARIABLES=$VARIABLES xargs -a $BENCHMARK_PATH/$BENCHMARK_LIST -L $BENCHS_PER_JOB ./schedule_job.sh
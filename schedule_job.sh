#! /bin/bash

source $VARIABLES

BENCH_COUNT=$#

UPPER_TIMEOUT_TOTAL=$(($BENCH_COUNT*$UPPER_TO))


FILES=$1
shift
while [[ $# -gt 0 ]]
do
FILES=$FILES:$1
shift
done
# $FILES contains all benchmark files that should be run by the current job
JOBID=`uuidgen`

FILE_LIST=$(mktemp -p $TMP_DIR)
echo $FILES > $FILE_LIST

if [ `hostname` = "hal9000" ]; then
    PAR_NUM="$PAR_NUM" SOURCE_SCRIPT="$SOURCE_SCRIPT" EXPERIMENT_DIR="$EXPERIMENT_DIR" BIN="$BIN" TO="$LOWER_TO" MEM="15000" FILES="$FILE_LIST" JOB_ID=$JOBID ARGS="$ARGS" BENCHMARK_PATH="$BENCHMARK_PATH" PARALLEL_PATH="$PARALLEL_PATH" LOG_DIR="$LOG_DIR" SOFTWARE_PATH="$SOFTWARE_PATH" ./single_job.sh 2> $LOG_DIR/err-$JOBID.log > $LOG_DIR/out-$JOBID.log
else
    qsub -e $LOG_DIR/err-$JOBID.log -o $LOG_DIR/out-$JOBID.log -l walltime=$UPPER_TIMEOUT_TOTAL,nodes=1:ppn=4 -v TO="$LOWER_TO",MEM="15000",FILES="$FILE_LIST",ARGS="$ARGS",BIN="$BIN",JOB_ID="$JOBID",BENCHMARK_PATH="$BENCHMARK_PATH",PARALLEL_PATH="$PARALLEL_PATH",LOG_DIR="$LOG_DIR",SOFTWARE_PATH="$SOFTWARE_PATH",EXPERIMENT_DIR="$EXPERIMENT_DIR",SOURCE_SCRIPT="$SOURCE_SCRIPT",PAR_NUM="$PAR_NUM" $EXPERIMENT_DIR/single_job.sh
fi
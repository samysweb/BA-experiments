#! /bin/bash

# Number of benchmarks that are packed into a single job
BENCHS_PER_JOB=300

# Timeout used for runlim
LOWER_TO=1200

# Timeout used for overall timeout of qsub (i.e. UPPER_TO*BENCHS_PER_JOB)
UPPER_TO=1220

if [ `hostname` = "hal9000" ]; then
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH=`pwd`"/../../Work/Software"
    # Path where benchmark files can be found
    BENCHMARK_PATH=`pwd`"/../srem_sdiv_mul_sat"
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="first100"
    # Directory for log writing
    LOG_DIR=`pwd`"/logs/Ablector_Mul/sat/"`date -Iminutes`
    # Binary which should be executed
    BIN="python3 "`pwd`"/../../Work/Software/ablector/ablector"
    # Path to GNU parallel executable
    PARALLEL_PATH=`pwd`"/../../Work/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR=`pwd`
    # Source Script
    SOURCE_SCRIPT=`pwd`"/Ablector_Sat/source.sh"
    # Number of parallel tasks
    PAR_NUM=1
else
    # Path where benchmark files can be found
    BENCHMARK_PATH="/raid/steuber/Benchmarks/srem_sdiv_mul_sat" #TODO
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="all"
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH="/raid/steuber/Software"
    # Directory for log writing
    LOG_DIR="/raid/steuber/Logs/Ablector_Mul/sat/"`date -Iminutes`"/"
    # Binary which should be executed
    BIN="python3 /raid/steuber/Software/ablector/ablector"
    # Path to GNU parallel executable
    PARALLEL_PATH="/raid/steuber/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR="/raid/steuber/Experiments/"
    # Source Script
    SOURCE_SCRIPT="/raid/steuber/Experiments/Ablector_Sat/source.sh"
    # Anaconda Path
    CONDA_PATH="/home/i12/steuber/anaconda3/condabin/conda"
    PAR_NUM=1
fi
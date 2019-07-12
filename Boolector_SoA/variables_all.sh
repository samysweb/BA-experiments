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
    BENCHMARK_PATH=`pwd`"/../srem_sdiv_mul"
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="all"
    # Directory for log writing
    LOG_DIR=`pwd`"/logs/Boolector_SoA/all/"`date -Iminutes`
    # Binary which should be executed
    BIN=`pwd`"/../../Work/Software/boolector/build/bin/boolector"
    # Additional arguments for the binary
    ARGS="-m"
    # Path to GNU parallel executable
    PARALLEL_PATH=`pwd`"/../../Work/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR=`pwd`
    PAR_NUM=4
    SOURCE_SCRIPT="/dev/null"
else
    # Path where benchmark files can be found
    BENCHMARK_PATH="/raid/steuber/Benchmarks/srem_sdiv_mul" #TODO
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="all"
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH="/raid/steuber/Software"
    # Directory for log writing
    LOG_DIR="/raid/steuber/Logs/Boolector_SoA/all/"`date -Iminutes`"/"
    # Binary which should be executed
    BIN="/raid/steuber/Software/boolector/build/bin/boolector"
    # Additional arguments for the binary
    ARGS=""
    # Path to GNU parallel executable
    PARALLEL_PATH="/raid/steuber/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR="/raid/steuber/Experiments/"
    PAR_NUM=1
    SOURCE_SCRIPT="/dev/null"
fi
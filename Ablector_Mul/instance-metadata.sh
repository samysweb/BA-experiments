#! /bin/bash

# Number of benchmarks that are packed into a single job
BENCHS_PER_JOB=200

# Timeout used for runlim
LOWER_TO=2400

# Timeout used for overall timeout of qsub (i.e. UPPER_TO*BENCHS_PER_JOB)
UPPER_TO=2440

if [ `hostname` = "hal9000" ]; then
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH=`pwd`"/../../Work/Software"
    # Path where benchmark files can be found
    BENCHMARK_PATH=`pwd`"/../srem_sdiv_mul"
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="metadata_all_missing.csv"
    # Directory for log writing
    LOG_DIR_BASE=`pwd`"/logs/Ablector_Mul/all/"
    # Binary which should be executed
    BIN="python3 "`pwd`"/logParsing/calcMeta.py"
    # Path to GNU parallel executable
    PARALLEL_PATH=`pwd`"/../../Work/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR=`pwd`
    # Source Script
    SOURCE_SCRIPT=`pwd`"/Ablector_Mul/source.sh"
    # Number of parallel tasks
    PAR_NUM=1
    # Additional arguments for ablector
    ARGS=""
    #Temporary directory for files
    TMP_DIR="/home/steuber/Dokumente/Hortus/Univ/KIT/Semester-8/BA/tmp"
else
    # Path where benchmark files can be found
    BENCHMARK_PATH="/raid/steuber/Benchmarks/srem_sdiv_mul" #TODO
    # List of benchmarks to run (paths relative to BENCHMARK_PATH)
    BENCHMARK_LIST="metadata_all_missing.csv"
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH="/raid/steuber/Software"
    # Directory for log writing
    LOG_DIR_BASE="/raid/steuber/Logs/Ablector_Mul/all/"
    # Binary which should be executed
    BIN="python3 /raid/steuber/Experiments/logParsing/calcMeta.py"
    # Path to GNU parallel executable
    PARALLEL_PATH="/raid/steuber/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR="/raid/steuber/Experiments/"
    # Source Script
    SOURCE_SCRIPT="/raid/steuber/Experiments/Ablector_Mul/source.sh"
    # Anaconda Path
    CONDA_PATH="/home/i12/steuber/anaconda3/condabin/conda"
    PAR_NUM=1
    # Additional arguments for ablector
    ARGS=""
    #Temporary directory for files
    TMP_DIR="/raid/steuber/tmp"
fi
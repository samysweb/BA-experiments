#! /bin/bash

# Number of benchmarks that are packed into a single job
BENCHS_PER_JOB=80

# Timeout used for runlim
LOWER_TO=1200

# Timeout used for overall timeout of qsub (i.e. UPPER_TO*BENCHS_PER_JOB)
UPPER_TO=1220

# List of benchmarks to run (paths relative to BENCHMARK_PATH)
BENCHMARK_LIST="unsat_mul_xdiv_xrem.txt"
# Additional arguments for the binary
ARGS="--ufReuse=0"


if [ `hostname` = "hal9000" ]; then
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH=`pwd`"/../../Work/Software"
    # Path where benchmark files can be found
    BENCHMARK_PATH=`pwd`"/../2019"
    # Directory for log writing
    LOG_DIR_BASE=`pwd`"/logs/Ablector_2019/unsat/"
    # Binary which should be executed
    BIN="python3 "`pwd`"/../../Work/Software/ablector/ablector"
    # Path to GNU parallel executable
    PARALLEL_PATH=`pwd`"/../../Work/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR=`pwd`
    PAR_NUM=2
    SOURCE_SCRIPT=`pwd`"/Ablector_Sat/source.sh"
    TMP_DIR="/home/steuber/Dokumente/Hortus/Univ/KIT/Semester-8/BA/tmp"
else
    # Path where benchmark files can be found
    BENCHMARK_PATH="/raid/steuber/Benchmarks/2019" #TODO
    # Path to folder containing all software packages potentially used
    SOFTWARE_PATH="/raid/steuber/Software"
    # Directory for log writing
    LOG_DIR_BASE="/raid/steuber/Logs/Ablector_2019/unsat/"
    # Binary which should be executed
    BIN="python3 /raid/steuber/Software/ablector/ablector"
    # Path to GNU parallel executable
    PARALLEL_PATH="/raid/steuber/Software/parallel-20190522/src/parallel"
    # Experiment directory
    EXPERIMENT_DIR="/raid/steuber/Experiments/"
    # Anaconda Path
    CONDA_PATH="/home/i12/steuber/anaconda3/condabin/conda"
    PAR_NUM=1
    SOURCE_SCRIPT="/raid/steuber/Experiments/Ablector_2019/source.sh"
    TMP_DIR="/raid/steuber/tmp"
fi
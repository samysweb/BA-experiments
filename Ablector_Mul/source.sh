#! /bin/bash
source ~/.bashrc
conda activate BA
export PYTHONPATH=$PYTHONPATH:$SOFTWARE_PATH/ablector/:$SOFTWARE_PATH/boolector/build/lib/
export PATH=$PATH:$SOFTWARE_PATH/boolector/build/bin
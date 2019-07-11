#! /bin/bash
runlim -r 1200 python $SOFTWARE_PATH/ablector/ablector $1
runlim -r 1200 python $SOFTWARE_PATH/ablector/ablector $1 --omit mul:0
runlim -r 1200 python $SOFTWARE_PATH/ablector/ablector $1 --omit mul:0 --omit mul:1
runlim -r 1200 python $SOFTWARE_PATH/ablector/ablector $1 --omit mul:0 --omit mul:1 --omit mul:2
#! /bin/bash

source ../logParsing/functions.sh

if newDir results/Boolector-vs-Stage0
then
    compare Stage0 Ablector_Stages/stage0/2020-05-14T10:24+02:00 2 Boolector Boolector_2019/unsat+unknown 1 satpart
fi

if newDir results/Stage0-vs-Stage01
then
    compare Stage01 Ablector_Stages/stage01/2020-05-14T10:24+02:00 2 Stage0 Ablector_Stages/stage0/2020-05-14T10:24+02:00 2 satpart
fi

if newDir results/Stage01-vs-Stage012
then
    compare Stage012 Ablector_Stages/stage012/2020-05-14T10:25+02:00 2 Stage01 Ablector_Stages/stage01/2020-05-14T10:24+02:00 2 satpart
fi

if newDir results/Stage012-vs-Ablector
then
    compare Ablector Ablector_2019/unsat+unknown 2 Stage012 Ablector_Stages/stage012/2020-05-14T10:25+02:00 2 satpart
fi

if newDir results/Stage023-vs-Ablector
then
    compare Ablector Ablector_2019/unsat+unknown 2 Stage023 Ablector_Stages/stage023/2020-05-15T16:07+02:00 2 satpart
fi
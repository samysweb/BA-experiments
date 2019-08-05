#! /bin/bash

source ../logParsing/functions.sh


if newDir results/sat/sdiv-pow2-rewriting-repaired
then
    compare sdiv Ablector_Mul/sat/2019-07-22T10:04+02:00 2 boolector Boolector_SoA/sat/2019-07-23T17:04+02:00 1 real time satpart
    buildHist Ablector_Mul/sat/2019-07-22T10:04+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-07-22T10:04+02:00 SdivNode 2 3
fi
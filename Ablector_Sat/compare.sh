#! /bin/bash

source ../logParsing/functions.sh

if newDir results/all/noUnderapprox-vs-Underapprox
then
    compare noUnderapprox Ablector_Mul/sat/2019-08-10T18:49+02:00 2 underapprox Ablector_Mul/sat/2019-12-31T16:27+01:00 2 real time satpart
    buildHist Ablector_Mul/sat/2019-08-10T18:49+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-08-10T18:49+02:00 SdivNode 2 3
    buildHist Ablector_Mul/sat/2019-12-31T16:27+01:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-12-31T16:27+01:00 SdivNode 2 3
fi

if newDir results/sat/sdiv-pow2-rewriting-repaired
then
    compare sdiv Ablector_Mul/sat/2019-07-22T10:04+02:00 2 boolector Boolector_SoA/sat/2019-08-08T10:50+02:00 1 real time satpart
    buildHist Ablector_Mul/sat/2019-07-22T10:04+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-07-22T10:04+02:00 SdivNode 2 3
fi

if newDir results/sat/sdiv-ufReuse1
then
    compare ablector Ablector_Mul/sat/2019-08-10T18:49+02:00 2 boolector Boolector_SoA/sat/2019-08-08T10:50+02:00 1 real time satpart
    buildHist Ablector_Mul/sat/2019-08-10T18:49+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-08-10T18:49+02:00 SdivNode 2 3
fi

if newDir results/sat/sdiv-ufReuse1-ufReuseInf
then
    compare ufReuse1 Ablector_Mul/sat/2019-08-10T18:49+02:00 2 ufReuseInf Ablector_Mul/sat/2019-07-22T10:04+02:00 2 real time satpart
fi
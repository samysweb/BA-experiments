#! /bin/bash

source ../logParsing/functions.sh


if newDir results/sat/ablector-ufReuse1
then
    compare Ablector Ablector_Mul/sat/2019-08-22T13:00+02:00 2 Boolector Boolector_SoA/sat/2019-08-08T10:50+02:00 1 satpart
    buildHist Ablector_Mul/sat/2019-08-22T13:00+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-08-22T13:00+02:00 SdivNode 2 3
fi

if newDir results/sat/ablector-ufReuse10
then
    compare Ablector Ablector_Mul/sat/2019-08-22T13:09+02:00 2 Boolector Boolector_SoA/sat/2019-08-08T10:50+02:00 1 satpart
    buildHist Ablector_Mul/sat/2019-08-22T13:09+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-08-22T13:09+02:00 SdivNode 2 3
fi

if newDir results/sat/ablector-ufReuseInf
then
    compare Ablector Ablector_Mul/sat/2019-08-22T13:06+02:00 2 Boolector Boolector_SoA/sat/2019-08-08T10:50+02:00 1 satpart
    buildHist Ablector_Mul/sat/2019-08-22T13:06+02:00 MulNode 2 3
    buildHist Ablector_Mul/sat/2019-08-22T13:06+02:00 SdivNode 2 3
fi

if newDir results/all/ablector-ufReuse1
then
    compare Ablector Ablector_Mul/all/2019-08-22T13:00+02:00 2 Boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-08-22T13:00+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-08-22T13:00+02:00 SdivNode 2 3
fi

if newDir results/all/ablector-ufReuse10
then
    compare Ablector Ablector_Mul/all/2019-08-22T13:09+02:00 2 Boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-08-22T13:09+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-08-22T13:09+02:00 SdivNode 2 3
fi

if newDir results/all/ablector-ufReuseInf
then
    compare Ablector Ablector_Mul/all/2019-08-22T13:06+02:00 2 Boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-08-22T13:06+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-08-22T13:06+02:00 SdivNode 2 3
fi
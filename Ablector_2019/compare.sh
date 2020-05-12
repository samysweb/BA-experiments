#! /bin/bash

source ../logParsing/functions.sh

if newDir results/unsat/Ablector-Boolector-2019
then
    compare Ablector Ablector_2019/unsat/2020-05-11T10:51+02:00 2 Boolector Boolector_2019/unsat/2020-05-12T00:16+02:00 1 satpart
    buildHist Ablector_2019/unsat/2020-05-11T10:51+02:00 MulNode 2 3
    buildHist Ablector_2019/unsat/2020-05-11T10:51+02:00 SdivNode 2 3
    buildHist Ablector_2019/unsat/2020-05-11T10:51+02:00 UdivNode 2 3
fi

if newDir results/unsat/Ablector-2019-vs-prev
then
    compare Ablector_2018 Ablector_Mul/all/2019-08-22T13:00+02:00 2 Ablector Ablector_2019/unsat/2020-05-11T10:51+02:00 2 satpart #ufReuseInf Ablector_Mul/all/2019-07-22T10:05+02:00 2 satpart
fi

if newDir results/unsat/Boolector-2019-vs-prev
then
    compare Boolector_2018 Boolector_SoA/all/2019-07-12T13:35+02:00 1 Boolector_2019 Boolector_2019/unsat/2020-05-12T00:16+02:00 1 satpart #ufReuseInf Ablector_Mul/all/2019-07-22T10:05+02:00 2 satpart
fi

if newDir results/unsat/Boolector-2019-vs-Ablector-prev
then
    compare Boolector_2019 Boolector_2019/unsat/2020-05-12T00:16+02:00 1  Ablector_2018 Ablector_Mul/all/2019-08-22T13:00+02:00 2 satpart #ufReuseInf Ablector_Mul/all/2019-07-22T10:05+02:00 2 satpart
fi

if newDir results/unknown/Ablector-Boolector-2019
then
    compare Ablector Ablector_2019/unknown/2020-05-12T11:13+02:00 2 Boolector Boolector_2019/unknown/2020-05-12T11:14+02:00 1 satpart
    buildHist Ablector_2019/unknown/2020-05-12T11:13+02:00 MulNode 2 3
    buildHist Ablector_2019/unknown/2020-05-12T11:13+02:00 SdivNode 2 3
    buildHist Ablector_2019/unknown/2020-05-12T11:13+02:00 UdivNode 2 3
fi

if newDir results/sat/Ablector-Boolector-2019
then
    compare Ablector Ablector_2019/sat/2020-05-11T10:52+02:00 2 Boolector Boolector_2019/sat/2020-05-12T00:16+02:00 1 satpart
    buildHist Ablector_2019/sat/2020-05-11T10:52+02:00 MulNode 2 3
    buildHist Ablector_2019/sat/2020-05-11T10:52+02:00 SdivNode 2 3
    buildHist Ablector_2019/sat/2020-05-11T10:52+02:00 UdivNode 2 3
fi
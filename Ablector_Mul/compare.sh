#! /bin/bash

source ../logParsing/functions.sh

if newDir results/all/noUnderapprox-vs-Underapprox
then
    compare noUnderapprox Ablector_Mul/all/2019-08-10T18:49+02:00 2 underapprox Ablector_Mul/all/2020-01-09T12:24+01:00 2 satpart
    buildHist Ablector_Mul/all/2019-08-10T18:49+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-08-10T18:49+02:00 SdivNode 2 3
    buildHist Ablector_Mul/all/2020-01-09T12:24+01:00 MulNode 2 3
    buildHist Ablector_Mul/all/2020-01-09T12:24+01:00 SdivNode 2 3
fi

if newDir results/segment_aa/basic
then
    compare ablector Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 satpart
    buildHist Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 MulNode 2 2
fi

if newDir results/segment_aa/singleStage
then
    compare ablector Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 satpart
    buildHist Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 MulNode 2 2
fi

if newDir results/segment_aa/belatedUF
then
    compare ablector Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 satpart
    buildHist Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 MulNode 2 2
fi

if newDir results/all/belatedUF
then
    compare ablector Ablector_Mul/all/2019-06-26T15:59+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-06-26T15:59+02:00 MulNode 2 2
fi

if newDir results/segment_aa/belatedUF-rewrite
then
    compare ablector Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 satpart
    buildHist Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 MulNode 2 2
fi

if newDir results/all/interval-mul
then
    compare ablector Ablector_Mul/all/2019-07-05T11:45+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-07-05T11:45+02:00 MulNode 2 2
fi

if newDir results/all/interval-mul-vs-belated-uf
then
    compare interval Ablector_Mul/all/2019-07-05T11:45+02:00 2 bitwise Ablector_Mul/all/2019-06-26T15:59+02:00 2 satpart
fi

if newDir results/all/sdiv-mul-interval
then
    compare ablector Ablector_Mul/all/2019-07-11T14:39+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-07-11T14:39+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-07-11T14:39+02:00 SdivNode 2 3
fi

if newDir results/all/mul-vs-sdiv-mul
then
    compare sdiv-mul Ablector_Mul/all/2019-07-11T14:39+02:00 2 mul Ablector_Mul/all/2019-07-05T11:45+02:00 2 satpart
fi

if newDir results/all/belatedUF-fullMul
then
    compare ablector Ablector_Mul/all/2019-07-06T16:11+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-07-06T16:11+02:00 MulNode 2 2
fi

if newDir results/all/belatedUF-fullMul-vs-self
then
    compare mul Ablector_Mul/all/2019-07-06T16:11+02:00 2 selfmade Ablector_Mul/all/2019-06-26T15:59+02:00 2 satpart
fi

if newDir results/all/sdiv-mul-interval-serial-vs-parallel
then
    compare parallel Ablector_Mul/all/2019-07-06T12:27+02:00 2 single Ablector_Mul/all/2019-07-11T14:39+02:00 2 satpart
    buildHist Ablector_Mul/all/2019-07-06T12:27+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-07-06T12:27+02:00 SdivNode 2 3
fi

if newDir results/all/Boolector-single-vs-parallel
then
    compare parallel Boolector_SoA/all/2019-06-26T15:59+02:00 1 single Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
fi

if newDir results/all/sdiv-pow2-rewriting
then
    compare sdiv Ablector_Mul/all/2019-07-15T10:23+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-07-15T10:23+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-07-15T10:23+02:00 SdivNode 2 3
fi

if newDir results/all/sdiv-pow2-rewriting-repaired
then
    compare sdiv Ablector_Mul/all/2019-07-22T10:05+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-07-22T10:05+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-07-22T10:05+02:00 SdivNode 2 3
fi


if newDir results/all/sdiv-pow2-ufReuse1
then
    compare ablector Ablector_Mul/all/2019-08-10T18:49+02:00 2 boolector Boolector_SoA/all/2019-07-12T13:35+02:00 1 satpart
    buildHist Ablector_Mul/all/2019-08-10T18:49+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-08-10T18:49+02:00 SdivNode 2 3
fi

if newDir results/all/ufReuseInf-vs-ufReuse1
then
    compare ufReuse1 Ablector_Mul/all/2019-08-10T18:49+02:00 2 ufReuseInf Ablector_Mul/all/2019-07-22T10:05+02:00 2 satpart
fi
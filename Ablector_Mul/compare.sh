#! /bin/bash

source ../logParsing/functions.sh

if newDir results/basic
then
    compare ablector Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 real time satpart
    buildHist Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 MulNode 2 2
fi

if newDir results/singleStage
then
    compare ablector Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 real time satpart
    buildHist Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 MulNode 2 2
fi

if newDir results/belatedUF
then
    compare ablector Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 real time satpart
    buildHist Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 MulNode 2 2
fi

if newDir results/belatedUF-all
then
    compare ablector Ablector_Mul/all/2019-06-26T15:59+02:00 2 boolector Boolector_SoA/all/2019-06-26T15:59+02:00 1 real time satpart
    buildHist Ablector_Mul/all/2019-06-26T15:59+02:00 MulNode 2 2
fi

if newDir results/belatedUF-rewrite
then
    compare ablector Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 2 boolector Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 1 real time satpart
    buildHist Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 MulNode 2 2
fi

if newDir results/interval-mul
then
    compare ablector Ablector_Mul/all/2019-07-05T11:45+02:00 2 boolector Boolector_SoA/all/2019-06-26T15:59+02:00 1 real time satpart
    buildHist Ablector_Mul/all/2019-07-05T11:45+02:00 MulNode 2 2
fi

if newDir results/interval-mul-vs-belated-uf
then
    compare interval Ablector_Mul/all/2019-07-05T11:45+02:00 2 bitwise Ablector_Mul/all/2019-06-26T15:59+02:00 2 real time satpart
fi

if newDir results/sdiv-mul-interval
then
    compare ablector Ablector_Mul/all/2019-07-06T12:27+02:00 2 boolector Boolector_SoA/all/2019-06-26T15:59+02:00 1 real time satpart
    buildHist Ablector_Mul/all/2019-07-06T12:27+02:00 MulNode 2 3
    buildHist Ablector_Mul/all/2019-07-06T12:27+02:00 SdivNode 2 3
fi

if newDir results/mul-vs-sdiv-mul
then
    compare sdiv-mul Ablector_Mul/all/2019-07-06T12:27+02:00 2 mul Ablector_Mul/all/2019-07-05T11:45+02:00 2 real time satpart
fi

if newDir results/belatedUF-all-fullMul
then
    compare ablector Ablector_Mul/all/2019-07-06T16:11+02:00 2 boolector Boolector_SoA/all/2019-06-26T15:59+02:00 1 real time satpart
    buildHist Ablector_Mul/all/2019-07-06T16:11+02:00 MulNode 2 2
fi

if newDir results/belatedUF-all-fullMul-vs-self
then
    compare mul Ablector_Mul/all/2019-07-06T16:11+02:00 2 selfmade Ablector_Mul/all/2019-06-26T15:59+02:00 2 real time satpart
fi

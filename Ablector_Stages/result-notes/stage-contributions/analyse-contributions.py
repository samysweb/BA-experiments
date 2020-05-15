import pandas as pd
import numpy as np

solvedByStage = []

boolectorDf = pd.read_csv("Boolector.csv", sep=" ", index_col="name")
unsolvedByBoolector=boolectorDf[boolectorDf.status == "UNKNOWN"].to_dict("index")

ablectorDf = pd.read_csv("Ablector.csv", sep=" ", index_col="name")
solvedByAblector=ablectorDf[ablectorDf.status == "UNSAT"].to_dict("index")

print("STAGE 0")
stage0Df = pd.read_csv("Stage0.csv", sep=" ", index_col="name")
unsolvedByStage0=stage0Df[stage0Df.status == "UNKNOWN"].to_dict("index")
totalCount=0
count = 0
for index, row in stage0Df[stage0Df.status == "UNSAT"].iterrows():
    if index in unsolvedByBoolector \
        and index in solvedByAblector:
        print(index)
        count+=1
print("CONTRIBUTION of STAGE 0: ",count)
totalCount+=count

print("STAGE 1")
stage1Df = pd.read_csv("Stage01.csv", sep=" ", index_col="name")
unsolvedByStage1=stage1Df[stage1Df.status == "UNKNOWN"].to_dict("index")
count = 0
for index, row in stage1Df[stage1Df.status == "UNSAT"].iterrows():
    if index in unsolvedByBoolector \
        and index in solvedByAblector\
        and index in unsolvedByStage0:
        print(index)
        count+=1
print("CONTRIBUTION of STAGE 1: ",count)
totalCount+=count

print("STAGE 2")
stage2Df = pd.read_csv("Stage012.csv", sep=" ", index_col="name")
unsolvedByStage2=stage2Df[stage2Df.status == "UNKNOWN"].to_dict("index")
count = 0
for index, row in stage2Df[stage2Df.status == "UNSAT"].iterrows():
    if index in unsolvedByBoolector \
        and index in solvedByAblector\
        and index in unsolvedByStage0\
        and index in unsolvedByStage1:
        print(index)
        count+=1
print("CONTRIBUTION of STAGE 2: ",count)
totalCount+=count

print("STAGE 3")
count = 0
for index, row in ablectorDf[ablectorDf.status == "UNSAT"].iterrows():
    if index in unsolvedByBoolector \
        and index in unsolvedByStage0\
        and index in unsolvedByStage1\
        and index in unsolvedByStage2:
        print(index)
        count+=1
print("CONTRIBUTION of STAGE 3: ",count)
totalCount+=count

print("Total contributions: ",totalCount)
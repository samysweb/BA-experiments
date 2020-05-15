import pandas as pd
import numpy as np

solvedByStage = []

boolectorDf = pd.read_csv("Boolector.csv", sep=" ", index_col="name")
solvedByBoolector=boolectorDf[boolectorDf.status == "UNSAT"].to_dict("index")

ablectorDf = pd.read_csv("Ablector.csv", sep=" ", index_col="name")
unsolvedByAblector=ablectorDf[ablectorDf.status == "UNKNOWN"].to_dict("index")

print("STAGE 0")
stage0Df = pd.read_csv("Stage0.csv", sep=" ", index_col="name")
solvedByStage0=stage0Df[stage0Df.status == "UNSAT"].to_dict("index")
totalCount=0
count = 0
for index, row in stage0Df[stage0Df.status == "UNKNOWN"].iterrows():
    if index in solvedByBoolector \
        and index in unsolvedByAblector:
        print(index)
        count+=1
print("COST of STAGE 0: ",count)
totalCount+=count

print("STAGE 1")
stage1Df = pd.read_csv("Stage01.csv", sep=" ", index_col="name")
solvedByStage1=stage1Df[stage1Df.status == "UNSAT"].to_dict("index")
count = 0
for index, row in stage1Df[stage1Df.status == "UNKNOWN"].iterrows():
    if index in solvedByBoolector\
        and index in solvedByStage0\
        and index in unsolvedByAblector:
        print(index)
        count+=1
print("COST of STAGE 1: ",count)
totalCount+=count


print("STAGE 2")
stage2Df = pd.read_csv("Stage012.csv", sep=" ", index_col="name")
solvedByStage2=stage2Df[stage2Df.status == "UNSAT"].to_dict("index")
count = 0
for index, row in stage2Df[stage2Df.status == "UNKNOWN"].iterrows():
    if index in solvedByBoolector\
        and index in solvedByStage0\
        and index in solvedByStage1 \
        and index in unsolvedByAblector:
        print(index)
        count+=1
print("COST of STAGE 2: ",count)
totalCount+=count

print("STAGE 3")
count = 0
for index, row in ablectorDf[ablectorDf.status == "UNKNOWN"].iterrows():
    if index in solvedByBoolector\
        and index in solvedByStage0\
        and index in solvedByStage1\
        and index in solvedByStage2:
        print(index)
        count+=1
print("COST of STAGE 3: ",count)
totalCount+=count

print("Total cost: ",totalCount)
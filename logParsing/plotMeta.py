import glob
import os
import sys
from pprint import pprint

import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def main():
    if len(sys.argv) < 5:
        raise Exception("plotMeta.py [metadataFile] [resultdataFile] [solver1-name] [solver2-name]")
    metadataFile = sys.argv[1]
    resultdataFile = sys.argv[2]

    solver1 = sys.argv[3]
    solver2 = sys.argv[4]

    metadata = pd.read_csv(metadataFile, sep=" ", dtype={"name":str,"bvmulCountT":str, "bvsdivCountT":str, "bvsremCountT":str, "opCountT":str, "bvmulCountD":np.uint64, "bvsdivCountD":np.uint64, "bvsremCountD":np.uint64, "opCountD":np.uint64})
    resultdata = pd.read_csv(resultdataFile, sep=" ")

    dataset = metadata.merge(resultdata, on="name", how="inner")

    dataset["bvmulPercD"] = dataset["bvmulCountD"] / dataset["opCountD"]
    dataset["bvsdivPercD"] = dataset["bvsdivCountD"] / dataset["opCountD"]
    dataset["bvsremPercD"] = dataset["bvsremCountD"] / dataset["opCountD"]
    dataset["results"] = dataset["status"]+"-"+dataset["status.1"]

    features = ["bvmulPercD", "bvsdivPercD", "bvsremPercD", "bvmulCountD", "bvsdivCountD", "bvsremCountD", "opCountD"]
    # Values
    x = dataset.loc[:, features].values
    # Standardizing the features
    x = StandardScaler().fit_transform(x)

    
    pca = PCA(n_components=3)
    principalComponents = pca.fit_transform(x)
    principalDf = pd.DataFrame(data = principalComponents, columns = ['principal component 1', 'principal component 2', 'principal component 3'])
    finalDf = pd.concat([principalDf, dataset[['results']]], axis = 1)

    fig = plt.figure(figsize = (8,8))
    ax = fig.add_subplot(111, projection='3d')
    ax.set_xlabel('Principal Component 1', fontsize = 15)
    ax.set_ylabel('Principal Component 2', fontsize = 15)
    ax.set_title('2 component PCA', fontsize = 20)
    targets = ['UNKNOWN-UNKNOWN', 'UNSAT-UNKNOWN', 'UNKNOWN-UNSAT', 'UNSAT-UNSAT']
    colors = ['b', 'r', 'g', 'y']
    for target, color in zip(targets,colors):
        indicesToKeep = finalDf['results'] == target
        ax.scatter(finalDf.loc[indicesToKeep, 'principal component 1']
                , finalDf.loc[indicesToKeep, 'principal component 2']
                , finalDf.loc[indicesToKeep, 'principal component 3']
                , c = color
                , s = 5)
    ax.legend(targets)
    ax.grid()
    plt.show()
    print("Explained variance: "+str(pca.explained_variance_ratio_))
    

if __name__ == "__main__":
    main()
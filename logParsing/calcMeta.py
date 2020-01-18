import sys
import os
import glob

import pysmt
from pysmt.smtlib.parser import SmtLibParser
from pysmt.environment import reset_env

def calcStats(script):
    formula = script.get_strict_formula()
    print("counting...", file=sys.stderr)
    opCountT = formula.size(pysmt.oracles.SizeOracle.MEASURE_TREE_NODES)
    opCountD = formula.size(pysmt.oracles.SizeOracle.MEASURE_DAG_NODES)
    print("transforming to smt...", file=sys.stderr)
    smt = formula.to_smtlib(daggify=True)
    print("counting...", file=sys.stderr)
    bvmulD = smt.count("bvmul")
    bvsdivD = smt.count("bvsrem")
    bvsremD = smt.count("bvsrem")
    smt = formula.to_smtlib(daggify=False)
    print("counting...", file=sys.stderr)
    bvmulT = smt.count("bvmul")
    bvsdivT = smt.count("bvsrem")
    bvsremT = smt.count("bvsrem")
    print("transforming to smt(dag)...", file=sys.stderr)
    print("returning...", file=sys.stderr)
    return (bvmulT, bvsdivT, bvsremT, opCountT,bvmulD, bvsdivD, bvsremD, opCountD)

def main():
    parser = SmtLibParser()
    parser._reset()
    reset_env()
    parser = SmtLibParser()
    with open(sys.argv[1]) as f:
        print("name bvmulCountT bvsdivCountT bvsremCountT opCountT bvmulCountD bvsdivCountD bvsremCountD opCountD", file=sys.stderr)
        print(sys.argv[1], file=sys.stderr)
        print("loading...", file=sys.stderr)
        script = parser.get_script(f)
        (bvmulT, bvsdivT, bvsremT, opCountT,bvmulD, bvsdivD, bvsremD, opCountD) = calcStats(script)
        print(sys.argv[1] + " " + str(bvmulT) + " " + str(bvsdivT) + " " + str(bvsremT) + " " + str(opCountT) + " " + str(bvmulD) + " " + str(bvsdivD) + " " + str(bvsremD) + " " + str(opCountD), flush=True)

if __name__ == "__main__":
    main()
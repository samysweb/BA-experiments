import sys
import os
import glob

import pysmt
from pysmt.smtlib.parser import SmtLibParser
from pysmt.environment import reset_env, get_env

from pysmt.oracles import SizeOracle

class MyOracle(SizeOracle):
    # (MEASURE_TREE_NODES,
    #  MEASURE_DAG_NODES,
    #  MEASURE_LEAVES,
    #  MEASURE_DEPTH,
    #  MEASURE_SYMBOLS,
    #  MEASURE_BOOL_DAG) = range(6)'
    MEASURE_BVMUL_DAG = 6
    MEASURE_BVSDIV_DAG = 7
    MEASURE_BVSREM_DAG = 8
    MEASURE_BVMUL_TREE = 9
    MEASURE_BVSDIV_TREE = 10 
    MEASURE_BVSREM_TREE = 11
    def __init__(self, env=None):
        super().__init__(env)
        self.measure_to_fun[self.MEASURE_BVMUL_DAG] = self.walk_count_bvmul
        self.measure_to_fun[self.MEASURE_BVSDIV_DAG] = self.walk_count_bvsdiv
        self.measure_to_fun[self.MEASURE_BVSREM_DAG] = self.walk_count_bvsrem
        self.measure_to_fun[self.MEASURE_BVMUL_TREE] = self.walk_count_bvmul_tree
        self.measure_to_fun[self.MEASURE_BVSDIV_TREE] = self.walk_count_bvsdiv_tree
        self.measure_to_fun[self.MEASURE_BVSREM_TREE] = self.walk_count_bvsrem_tree

    def walk_count_bvmul(self, formula, args, measure, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_mul()
        a_res = frozenset([x for s in args for x in s])
        if is_sym:
            return frozenset([formula]) | a_res
        return a_res

    def walk_count_bvmul_tree(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_mul()
        if is_sym:
            return 1 + sum(args)
        return sum(args)
    
    def walk_count_bvsdiv(self, formula, args, measure, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_sdiv()
        a_res = frozenset([x for s in args for x in s])
        if is_sym:
            return frozenset([formula]) | a_res
        return a_res
    
    def walk_count_bvsdiv_tree(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_sdiv()
        if is_sym:
            return 1 + sum(args)
        return sum(args)

    def walk_count_bvsrem(self, formula, args, measure, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_srem()
        a_res = frozenset([x for s in args for x in s])
        if is_sym:
            return frozenset([formula]) | a_res
        return a_res
    
    def walk_count_bvsrem_tree(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_bv_srem()
        if is_sym:
            return 1 + sum(args)
        return sum(args)
    
    def get_size(self, formula, measure=None):
        """Return the size of the formula according to the specified measure.

        The default measure is MEASURE_TREE_NODES.
        """
        if measure is None:
            # By default, count tree nodes
            measure = SizeOracle.MEASURE_TREE_NODES

        self.set_walking_measure(measure)
        res = self.walk(formula, measure=measure)

        if measure == SizeOracle.MEASURE_DAG_NODES or \
           measure == SizeOracle.MEASURE_SYMBOLS or \
           measure == SizeOracle.MEASURE_BOOL_DAG or \
           measure == MyOracle.MEASURE_BVMUL_DAG or \
           measure == MyOracle.MEASURE_BVSDIV_DAG or \
           measure == MyOracle.MEASURE_BVSREM_DAG :
            return len(res)
        return res

def calcStats(script):
    formula = script.get_strict_formula()
    print("counting...", flush=True, file=sys.stderr)
    oracle = MyOracle(get_env())

    opCountD = oracle.get_size(formula, MyOracle.MEASURE_DAG_NODES)
    print("counting dag...", flush=True, file=sys.stderr)
    bvmulD = oracle.get_size(formula, MyOracle.MEASURE_BVMUL_DAG)
    bvsdivD = oracle.get_size(formula, MyOracle.MEASURE_BVSDIV_DAG)
    bvsremD = oracle.get_size(formula, MyOracle.MEASURE_BVSREM_DAG)

    print("counting tree...", flush=True, file=sys.stderr)
    opCountT = oracle.get_size(formula, MyOracle.MEASURE_TREE_NODES)
    bvmulT = oracle.get_size(formula, MyOracle.MEASURE_BVMUL_TREE)
    bvsdivT = oracle.get_size(formula, MyOracle.MEASURE_BVSDIV_TREE)
    bvsremT = oracle.get_size(formula, MyOracle.MEASURE_BVSREM_TREE)

    print("transforming to smt(dag)...", flush=True, file=sys.stderr)
    print("returning...", flush=True, file=sys.stderr)
    return (bvmulT, bvsdivT, bvsremT, opCountT, bvmulD, bvsdivD, bvsremD, opCountD)

def main():
    parser = SmtLibParser()
    parser._reset()
    reset_env()
    parser = SmtLibParser()
    with open(sys.argv[1]) as f:
        print("name opCountT opCountD bvmulCountD bvsdivCountD bvsremCountD", flush=True, file=sys.stderr)
        print(sys.argv[1], flush=True, file=sys.stderr)
        print("loading...", flush=True, file=sys.stderr)
        script = parser.get_script(f)
        (bvmulT, bvsdivT, bvsremT, opCountT, bvmulD, bvsdivD, bvsremD, opCountD) = calcStats(script)
        print(sys.argv[1] + " " + str(bvmulT) + " " + str(bvsdivT) + " " + str(bvsremT) + " " + str(opCountT) + " " + str(bvmulD) + " " + str(bvsdivD) + " " + str(bvsremD) + " " + str(opCountD), flush=True)

if __name__ == "__main__":
    main()
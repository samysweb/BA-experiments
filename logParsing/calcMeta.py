import sys
import os
import glob

from pprint import pprint

import pysmt
from pysmt.smtlib.parser import SmtLibParser
from pysmt.environment import reset_env, get_env
import pysmt.walkers as walkers
import pysmt.operators as op

from pysmt.oracles import SizeOracle


from pysmt.walkers.generic import Walker

class CallObject:
    def __init__(self, formParam, belongsParam):
        self.formula = formParam
        self.belongsTo = belongsParam
        self.args = []


class MyOracle:
    # (MEASURE_TREE_NODES,
    #  MEASURE_DAG_NODES,
    #  MEASURE_LEAVES,
    #  MEASURE_DEPTH,
    #  MEASURE_SYMBOLS,
    #  MEASURE_BOOL_DAG) = range(6)'
    (MEASURE_TREE_NODES,
     MEASURE_DAG_NODES,
     MEASURE_LEAVES,
     MEASURE_DEPTH,
     MEASURE_SYMBOLS,
     MEASURE_BOOL_DAG,
     MEASURE_BVMUL_DAG,
     MEASURE_BVSDIV_DAG,
     MEASURE_BVSREM_DAG) = range(9)

    countingRound = 2

    countingHash = {}

    walkingMeasure = None

    walkingStack = []

    def __init__(self, env=None):
        self.measure_to_fun = \
                        {MyOracle.MEASURE_TREE_NODES: self.walk_count_tree,
                         MyOracle.MEASURE_DAG_NODES: self.walk_count_dag,
                         MyOracle.MEASURE_LEAVES: self.walk_count_leaves,
                         MyOracle.MEASURE_DEPTH: self.walk_count_depth,
                         MyOracle.MEASURE_SYMBOLS: self.walk_count_symbols,
                         MyOracle.MEASURE_BOOL_DAG: self.walk_count_bool_dag,
                         MyOracle.MEASURE_BVMUL_DAG: self.walk_count_bvmul,
                         MyOracle.MEASURE_BVSDIV_DAG: self.walk_count_bvsdiv,
                         MyOracle.MEASURE_BVSREM_DAG: self.walk_count_bvsrem
                        }
    
    def iter_walk(self):
        res = None
        while(len(self.walkingStack)>0):
            current = self.walkingStack.pop()
            curArgs = current.formula.args()
            if len(current.args) == len(curArgs):
                current.args.reverse()
                res = self.walkingMeasure(current.formula, current.args)
                if current.belongsTo is not None:
                    current.belongsTo.args.append(res)
                else:
                    return res
            else:
                self.walkingStack.append(current)
                for a in curArgs:
                    self.walkingStack.append(CallObject(a, current))
                


    def walk(self, formula):
        self.walkingStack.append(CallObject(formula,None))
        return self.iter_walk()
    
    def get_size(self, formula, measure=None):
        """Return the size of the formula according to the specified measure.

        The default measure is MEASURE_TREE_NODES.
        """
        self.countingRound+=1
        if measure is None:
            # By default, count tree nodes
            measure = SizeOracle.MEASURE_TREE_NODES

        self.walkingMeasure = self.measure_to_fun[measure]
        res = self.walk(formula)

        # if measure == SizeOracle.MEASURE_DAG_NODES or \
        #    measure == SizeOracle.MEASURE_SYMBOLS or \
        #    measure == SizeOracle.MEASURE_BOOL_DAG or \
        #    measure == MyOracle.MEASURE_BVMUL_DAG or \
        #    measure == MyOracle.MEASURE_BVSDIV_DAG or \
        #    measure == MyOracle.MEASURE_BVSREM_DAG :
        #     return len(res)
        return res

    def walk_count_dag(self, formula, args, **kwargs):
        if hash(formula) not in self.countingHash or self.countingHash[hash(formula)] != self.countingRound:
            self.countingHash[hash(formula)] = self.countingRound
            # print(args)
            return 1+sum(args)
        else:
            return 0

    def walk_count_bvmul(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        if hash(formula) not in self.countingHash or self.countingHash[hash(formula)] != self.countingRound:
            self.countingHash[hash(formula)] = self.countingRound
            is_sym = formula.is_bv_mul()
            if is_sym:
                return 1 + sum(args)
            else:
                return sum(args)
        else:
            return 0
    
    def walk_count_bvsdiv(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        if hash(formula) not in self.countingHash or self.countingHash[hash(formula)] != self.countingRound:
            self.countingHash[hash(formula)] = self.countingRound
            is_sym = formula.is_bv_sdiv()
            if is_sym:
                return 1 + sum(args)
            else:
                return sum(args)
        else:
            return 0

    def walk_count_bvsrem(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        if hash(formula) not in self.countingHash or self.countingHash[hash(formula)] != self.countingRound:
            self.countingHash[hash(formula)] = self.countingRound
            is_sym = formula.is_bv_srem()
            if is_sym:
                return 1 + sum(args)
            else:
                return sum(args)
        else:
            return 0

    def walk_count_tree(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        return 1 + sum(args)

    def walk_count_leaves(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        is_leaf = (len(args) == 0)
        return (1 if is_leaf else 0) + sum(args)

    def walk_count_depth(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        is_leaf = (len(args) == 0)
        return 1 + (0 if is_leaf else max(args))

    def walk_count_symbols(self, formula, args, measure, **kwargs):
        #pylint: disable=unused-argument
        is_sym = formula.is_symbol()
        a_res = frozenset([x for s in args for x in s])
        if is_sym:
            return frozenset([formula]) | a_res
        return a_res

    def walk_count_bool_dag(self, formula, args, **kwargs):
        #pylint: disable=unused-argument
        if formula.is_theory_relation():
            return frozenset([formula])
        return frozenset([formula]) | frozenset([x for s in args for x in s])

def calcStats(script):
    formula = script.get_strict_formula()
    print("counting...", flush=True, file=sys.stderr)
    oracle = MyOracle(get_env())
    origOracle = SizeOracle(get_env())

    opCountD = oracle.get_size(formula, MyOracle.MEASURE_DAG_NODES)
    print("counting dag...", flush=True, file=sys.stderr)
    bvmulD = oracle.get_size(formula, MyOracle.MEASURE_BVMUL_DAG)
    bvsdivD = oracle.get_size(formula, MyOracle.MEASURE_BVSDIV_DAG)
    bvsremD = oracle.get_size(formula, MyOracle.MEASURE_BVSREM_DAG)

    print("counting tree...", flush=True, file=sys.stderr)
    leaves = oracle.get_size(formula, MyOracle.MEASURE_LEAVES)
    assert(leaves ==origOracle.get_size(formula,SizeOracle.MEASURE_LEAVES))
    depth = oracle.get_size(formula, MyOracle.MEASURE_DEPTH)
    assert(depth == origOracle.get_size(formula,SizeOracle.MEASURE_DEPTH))

    print("transforming to smt(dag)...", flush=True, file=sys.stderr)
    print("returning...", flush=True, file=sys.stderr)
    return (bvmulD, bvsdivD, bvsremD, opCountD, leaves, depth)

def main():
    parser = SmtLibParser()
    parser._reset()
    reset_env()
    parser = SmtLibParser()
    with open(sys.argv[1]) as f:
        print("name bvmulCountD bvsdivCountD bvsremCountD opCountD leaveCount, depth", flush=True, file=sys.stderr)
        print(sys.argv[1], flush=True, file=sys.stderr)
        print("loading...", flush=True, file=sys.stderr)
        script = parser.get_script(f)
        (bvmulD, bvsdivD, bvsremD, opCountD, leaves, depth) = calcStats(script)
        print(sys.argv[1] + " " + str(bvmulD) + " " + str(bvsdivD) + " " + str(bvsremD) + " " + str(opCountD) + " " + str(leaves) + " " + str(depth), flush=True)

if __name__ == "__main__":
    main()
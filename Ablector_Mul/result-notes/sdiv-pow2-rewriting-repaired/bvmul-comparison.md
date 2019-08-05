# Only solved by Boolector (18 cases)
`grep -oE "\\(bvmul" $(cat only-boolector.txt | sed --expression 's#^#../../../../#') | wc -l`
=> 760.117 appearances of bvmul 42.228,72 appearances per instance on average
`grep -oE "\(bvmul" $(cat only-boolector.txt | sed --expression 's#^#../../../../#') | uniq -c | sort -n`
      2 ../../../../srem_sdiv_mul/QF_BV/brummayerbiere2/smulov2bw512.smt2:(bvmul
      9 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_13211.smt2:(bvmul
     41 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_188.smt2:(bvmul
     41 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_256.smt2:(bvmul
     41 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_392.smt2:(bvmul
    513 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_10328.smt2:(bvmul
    840 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_9036.smt2:(bvmul
   1903 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_13001.smt2:(bvmul
   3844 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_9793.smt2:(bvmul
   6195 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_1471.smt2:(bvmul
   7552 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_17707.smt2:(bvmul
   9312 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_13528.smt2:(bvmul
  10143 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_9395.smt2:(bvmul
  19124 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_11010.smt2:(bvmul
  26417 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_13594.smt2:(bvmul
 654140 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_9140.smt2:(bvmul
# Solved by Ablector (5763)
`grep -oE "\\(bvmul" $(cat ablector-solved.txt | sed --expression 's#^#../../../../#') | wc -l`
=> 3.864.489 results in 670,56 instances on average
`grep -oE "\(bvmul" $(cat ablector-solved.txt | sed --expression 's#^#../../../../#') | uniq -c | sort -n | sed -n '1p;$p'`
      1 ../../../../srem_sdiv_mul/QF_BV/bmc-bv/ex2_prime.smt2:(bvmul
  24159 ../../../../srem_sdiv_mul/QF_BV/Sage2/bench_13199.smt2:(bvmul
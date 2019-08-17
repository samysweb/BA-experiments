# 2019-06-26T15:59+02:00
Ablector commit `bba057c788bb1fcc64a517b25a4f015c2fe3fa49`
First stage: mul(a,b), base cases and bit shifting
Second stage: uf relations (symmetry etc.)
Third stage: adding bits
#2019-07-05T11:45+02:00
Ablector commit `fa2056271c7ed3c173e7e6473f185ca596c8c46e`
First stage: mul(a,b), base cases and bit shifting
Second stage: uf relations (symmetry etc.)
Third stage: interval wise multiplication
#2019-07-05T16:17+02:00
Ablector commit `50950db7cc8513722694409e342a7a4000b1f111`
## bvmul
First stage: mul(a,b), base cases and bit shifting
Second stage: uf relations (symmetry etc.)
Third stage: interval wise multiplication
## bvsdiv
First stage: sdiv(a,b), base cases, bit shifting
Second stage: uf relations
Third stage: interval wise division
#2019-07-06T12:27+02:00
Ablector commit `4310cdacbd1687a40a130f23ebc199a15700b66b`
## bvmul
First stage: mul(a,b), base cases
Second stage: bit shifting
Third stage: uf relations (symmetry etc.)
Fourth stage: interval wise multiplication
## bvsdiv
First stage: sdiv(a,b), base cases
Second stage: bit shifting
Third stage: uf relations
Fourth stage: interval wise division
#2019-07-06T16:11+02:00
Ablector commit `fb6af50376ae9fc05ea7356b1e898be739fc8b10`
Just like 2019-06-26T15:59+02:00 (belated-uf) but with "original" multiplication
#2019-07-11T14:39+02:00
Ablector commit `391fd7f5cd480478aec68afdc16154bd86b26361`
More or less the same like `2019-07-06T12:27+02:00` but with one instance run per processor
#2019-07-15T10:23+02:00
Ablector commit `69a6b9423ca6c318d714128f65875d52ff47349b`
Based on `2019-07-11T14:39+02:00` but additions:
- beforehand rewriting to check for for (assert false) statements (abort if exits)
- solve power 2 cases in stage 0
#2019-07-22T10:05+02:00
Ablector commit `3b25ada04f3434edcaae6fd5d8aa829e4957062a`
Based on `2019-07-15T10:23+02:00` but with fixed bugs
# 2019-08-09T12:02+02:00
Ablector commit: `4301716753e46e50a413c6b676f1d98d3a50f37d`
Bug!
# 2019-08-10T18:49+02:00
Ablector commit: `c7acfbb958dbb9455de80a554f6ebcebb9f2423a`
ufReuse=1
python ../logParsing/buildCsv.py 2 ../Logs/Ablector_Mul/segment_aa/2019-06-17T11:11+02:00 | sort > ablector.csv
python ../logParsing/buildCsv.py 2 ../Logs/Boolector_SoA/segment_aa/2019-06-13T10:16+02:00 | sort > boolector.csv
../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.eps boolector-vs-ablector-real.eps
../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.eps boolector-vs-ablector-time.eps
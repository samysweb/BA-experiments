mkdir -p results
cd results
python ../../logParsing/buildCsv.py 2 ../../Logs/Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 | sort > ablector.csv
python ../../logParsing/buildCsv.py 2 ../../Logs/Boolector_SoA/segment_aa/2019-06-17T16:49+02:00 | sort > boolector.csv
../../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.eps boolector-vs-ablector-real.eps
../../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.eps boolector-vs-ablector-time.eps
../../logParsing/plot_new.sh boolector.csv ablector.csv satpart | gnuplot
mv boolector-vs-ablector.eps boolector-vs-ablector-satpart.eps
python ../../logParsing/histData.py 2 ../../Logs/Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 level.csv bit.csv
../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp
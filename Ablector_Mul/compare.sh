mkdir -p results/basic
cd results/basic
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 | sort > ablector.csv
python ../../../logParsing/buildCsv.py 1 ../../../Logs/Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 | sort > boolector.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-real.png
mv boolector-vs-ablector.csv boolector-vs-ablector-real.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-time.png
mv boolector-vs-ablector.csv boolector-vs-ablector-time.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv satpart | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-satpart.png
mv boolector-vs-ablector.csv boolector-vs-ablector-satpart.csv
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/singleStage
cd results/singleStage
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 | sort > ablector.csv
python ../../../logParsing/buildCsv.py 1 ../../../Logs/Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 | sort > boolector.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-real.png
mv boolector-vs-ablector.csv boolector-vs-ablector-real.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-time.png
mv boolector-vs-ablector.csv boolector-vs-ablector-time.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv satpart | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-satpart.png
mv boolector-vs-ablector.csv boolector-vs-ablector-satpart.csv
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/belatedUF
cd results/belatedUF
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 | sort > ablector.csv
python ../../../logParsing/buildCsv.py 1 ../../../Logs/Boolector_SoA/segment_aa/2019-06-19T22:40+02:00 | sort > boolector.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-real.png
mv boolector-vs-ablector.csv boolector-vs-ablector-real.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-time.png
mv boolector-vs-ablector.csv boolector-vs-ablector-time.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv satpart | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-satpart.png
mv boolector-vs-ablector.csv boolector-vs-ablector-satpart.csv
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/belatedUF-all
cd results/belatedUF-all
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-06-26T15:59+02:00 | sort > ablector.csv
python ../../../logParsing/buildCsv.py 1 ../../../Logs/Boolector_SoA/all/2019-06-26T15:59+02:00 | sort > boolector.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv real | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-real.png
mv boolector-vs-ablector.csv boolector-vs-ablector-real.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv time | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-time.png
mv boolector-vs-ablector.csv boolector-vs-ablector-time.csv
../../../logParsing/plot_new.sh boolector.csv ablector.csv satpart | gnuplot
mv boolector-vs-ablector.png boolector-vs-ablector-satpart.png
mv boolector-vs-ablector.csv boolector-vs-ablector-satpart.csv
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/all/2019-06-26T15:59+02:00 level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp
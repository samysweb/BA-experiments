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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-17T16:50+02:00 MulNode level.csv bit.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-19T22:40+02:00 MulNode level.csv bit.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-24T15:08+02:00 MulNode level.csv bit.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/all/2019-06-26T15:59+02:00 MulNode level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/belatedUF-rewrite
cd results/belatedUF-rewrite
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 | sort > ablector.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/segment_aa/2019-06-30T09:57+02:00 MulNode level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/interval-mul
cd results/interval-mul
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T11:45+02:00 | sort > ablector.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T11:45+02:00 MulNode level.csv bit.csv
../../../logParsing/plot_hist.sh 3 level.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/interval-mul-vs-belated-uf
cd results/interval-mul-vs-belated-uf
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T11:45+02:00 | sort > interval.csv
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-06-26T15:59+02:00 | sort > bitwise.csv
../../../logParsing/plot_new.sh bitwise.csv interval.csv real | gnuplot
mv bitwise-vs-interval.png bitwise-vs-interval-real.png
mv bitwise-vs-interval.csv bitwise-vs-interval-real.csv
../../../logParsing/plot_new.sh bitwise.csv interval.csv time | gnuplot
mv bitwise-vs-interval.png bitwise-vs-interval-time.png
mv bitwise-vs-interval.csv bitwise-vs-interval-time.csv
../../../logParsing/plot_new.sh bitwise.csv interval.csv satpart | gnuplot
mv bitwise-vs-interval.png bitwise-vs-interval-satpart.png
mv bitwise-vs-interval.csv bitwise-vs-interval-satpart.csv
rm -f *.tmp

cd ../../

mkdir -p results/sdiv-mul-interval
cd results/sdiv-mul-interval
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T16:17+02:00 | sort > ablector.csv
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
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T16:17+02:00 MulNode level-mul.csv bit-mul.csv
python ../../../logParsing/histData.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T16:17+02:00 SdivNode level-sdiv.csv bit-sdiv.csv
../../../logParsing/plot_hist.sh 3 level-mul.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit-mul.csv | gnuplot
../../../logParsing/plot_hist.sh 3 level-sdiv.csv | gnuplot
../../../logParsing/plot_hist.sh 3 bit-sdiv.csv | gnuplot
rm -f *.tmp

cd ../../

mkdir -p results/mul-vs-sdiv-mul
cd results/mul-vs-sdiv-mul
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T16:17+02:00 | sort > sdiv-mul.csv
python ../../../logParsing/buildCsv.py 2 ../../../Logs/Ablector_Mul/all/2019-07-05T11:45+02:00 | sort > mul.csv
../../../logParsing/plot_new.sh mul.csv sdiv-mul.csv real | gnuplot
mv mul-vs-sdiv-mul.png mul-vs-sdiv-mul-real.png
mv mul-vs-sdiv-mul.csv mul-vs-sdiv-mul-real.csv
../../../logParsing/plot_new.sh mul.csv sdiv-mul.csv time | gnuplot
mv mul-vs-sdiv-mul.png mul-vs-sdiv-mul-time.png
mv mul-vs-sdiv-mul.csv mul-vs-sdiv-mul-time.csv
../../../logParsing/plot_new.sh mul.csv sdiv-mul.csv satpart | gnuplot
mv mul-vs-sdiv-mul.png mul-vs-sdiv-mul-satpart.png
mv mul-vs-sdiv-mul.csv mul-vs-sdiv-mul-satpart.csv
rm -f *.tmp
#! /bin/bash
file=$2
key=$1

max=$((`cat $file | tail -n +2 | sort -n -k$key | cut -d" " -f3 | tail -1`+1))
min=`cat $file | tail -n +2 | sort -n -k$key | cut -d" " -f3 | head -1`
echo $max >&2
echo $min >&2
echo "reset"
echo "n=$(($max-$min)) #number of intervals"
echo "max=$max. #max value"
echo "min=$min. #min value"
echo "width=1 #interval width"
echo "#function used to map a value to the intervals"
echo "hist(x,width)=width*floor(x/width)+width/2.0"
echo "set terminal png enhanced font 'Verdana,10'"
dir=`pwd`
echo "set output '$dir/$file.hist.png'"
echo "set xrange [($min-0.5):($max-0.5)]"
echo "set logscale y"
echo "set yrange [0:*]"
echo "#to put an empty boundary around the"
echo "#data inside an autoscaled graph."
echo "set offset graph 0.05,0.05,0.05,0.0"
echo "set xtics min,1,max"
echo "set boxwidth width*0.9"
echo "set style fill solid 0.5 #fillstyle"
echo "set tics out nomirror"
echo "set xlabel \"x\""
echo "set ylabel \"Frequency\""
echo "#count and plot"
echo "plot \"$file\" u (hist(\$$key,width)-0.5):(1.0) smooth freq w boxes lc rgb \"#7d92cb\" notitle"
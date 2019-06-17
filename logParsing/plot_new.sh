#!/bin/bash
# By Markus Iser

if [ $# -lt 3 ]; then
  echo "Usage: $0 file1 file2 column-name"
  exit
fi

file1=$1
file2=$2
title1=$3
title2=$3
c1=`head -1 $file1 | tr " " "\n" | grep -w -n $title1 | cut -d':' -f1`
c2=`head -1 $file2 | tr " " "\n" | grep -w -n $title2 | cut -d':' -f1`

# create temp-file
tmp="$$.tmp"
join -o"1.1 1.2 1.$c1 2.$c2" $file1 $file2 > $tmp

offset=1

# determine border and scale-border
max1=`cat $tmp | sort -n -k3 | cut -d" " -f3 | tail -1`
max2=`cat $tmp | sort -n -k4 | cut -d" " -f4 | tail -1`
max=$(( max1 > max2 ? max1 : max2 ))
border=1; 
while [ $border -lt $max ]; do border=$(( border * 10 )); done;
step=$(( border / 10 )); 
while [ $border -ge $max ]; do border=$(( border - step )); done;
border=$(( border + step ));
scale_border=$(( border + step ));

sed -i 's/ -1/ $border/g' $tmp

echo "set terminal bash"
#echo "set key outside left top"
echo "set key off"
echo "set logscale x"
echo "set logscale y"
#echo "set title \"Total Time\""

echo "f(x)=x"
echo "g(x)=10*x"
echo "h(x)=x/10"
echo "xout=$border"

echo "set datafile separator ' '"
echo "set size square 1,1"

name1=`echo ${file1##*/} | cut -d'.' -f1 | sed s/\_/-/g`
name2=`echo ${file2##*/} | cut -d'.' -f1 | sed s/\_/-/g`
t1=$(echo $file1 | cut -d"_" -f2 | cut -d"." -f1)
t2=$(echo $file2 | cut -d"_" -f2 | cut -d"." -f1)
echo "set xlabel '$title1 of $t1'"
echo "set ylabel '$title2 of $t2'"

echo "set xrange [$offset:$scale_border]"
echo "set yrange [$offset:$scale_border]"

echo "set style line 1 lt 1 lw 1 lc rgb '#fbb252'"

echo "plot xout ls 1 title 'xout'"
echo "set arrow from $border,$offset to $border,$scale_border nohead ls 1"
echo "replot f(x) lc rgb '#e27152' lt 1 lw 1 notitle"
echo "replot g(x) lc rgb '#fbb252' lt 0 lw 1 notitle"
echo "replot h(x) lc rgb '#fbb252' lt 0 lw 1 notitle"

echo "replot '$tmp' u (strcol(2) eq 'UNKNOWN') ? (\$3<${offset}?${offset}:\$3) : (1/0) : (\$4<${offset}?${offset}:\$4) title '$title' with points lc rgb '#000000' pt 2"
echo "replot '$tmp' u (strcol(2) eq 'UNSAT')   ? (\$3<${offset}?${offset}:\$3) : (1/0) : (\$4<${offset}?${offset}:\$4) title '$title' with points lc rgb '#1d0a42' pt 6"
echo "replot '$tmp' u (strcol(2) eq 'SAT')     ? (\$3<${offset}?${offset}:\$3) : (1/0) : (\$4<${offset}?${offset}:\$4) title '$title' with points lc rgb '#6d1855' pt 2"

echo "set terminal postscript eps enhanced color"
dir=`pwd`
echo "set output '$dir/$name1-vs-$name2.eps'"
echo "replot"

#rm $tmp



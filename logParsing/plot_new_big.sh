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

name1=`echo ${file1##*/} | cut -d'.' -f1 | sed s/\_/-/g`
name2=`echo ${file2##*/} | cut -d'.' -f1 | sed s/\_/-/g`

# create temp-file
tmp="$name1-vs-$name2-big.csv"
join -o"1.1 1.2 2.2 1.$c1 2.$c2" $file1 $file2 | awk -F ' '  '($4 > 1 || $5 > 1) {  print $0 }' - > $tmp

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

echo "set terminal unknown"
#echo "set key outside left top"
echo "set key right bottom"
echo "set logscale x"
echo "set logscale y"
#echo "set title \"Total Time\""

echo "f(x)=x"
echo "g(x)=10*x"
echo "h(x)=x/10"
echo "xout=$border"

echo "set datafile separator ' '"
echo "set size square 1,1"

t1=$(echo $file1 | cut -d"_" -f2 | cut -d"." -f1)
t2=$(echo $file2 | cut -d"_" -f2 | cut -d"." -f1)
echo "set xlabel '$title1 of $t1'"
echo "set ylabel '$title2 of $t2'"

echo "set xrange [$offset:$scale_border]"
echo "set yrange [$offset:$scale_border]"

echo 'set xtics ("10⁻³" 1, "0.01" 10, "0.1" 100, "1" 1000, "10" 10000, "100" 100000, "1000" 1000000)'
echo 'set ytics ("10⁻³" 1, "0.01" 10, "0.1" 100, "1" 1000, "10" 10000, "100" 100000, "1000" 1000000)'

echo "set style line 1 lt 1 lw 1 lc rgb '#fbb252'"

echo "plot xout ls 1 notitle"
echo "set arrow from $border,$offset to $border,$scale_border nohead ls 1"

echo "replot '$tmp' u (strcol(2) eq strcol(3) && !(strcol(2) eq 'UNKNOWN')) ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'solved by both' with points lc rgb '#000000' pt 3" #black

echo "replot '$tmp' u (strcol(2) eq 'UNKNOWN' && !(strcol(2) eq strcol(3)))   ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'only solved by $t2' with points lc rgb '#4cb5a7' pt 2" #green
echo "replot '$tmp' u (strcol(3) eq 'UNKNOWN' && !(strcol(2) eq strcol(3)))     ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'only solved by $t1' with points lc rgb '#e6bc61' pt 4" #red

echo "replot '$tmp' u (strcol(2) eq strcol(3) && strcol(2) eq 'UNKNOWN') ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'unknown to both' with points lc rgb '#7d92cb' pt 1" #blue

echo "replot f(x) lc rgb '#ff00ff' lt 1 lw 1 notitle"
echo "replot g(x) lc rgb '#ff00ff' lt 2 lw 1 notitle"
echo "replot h(x) lc rgb '#ff00ff' lt 2 lw 1 notitle"


#echo "set terminal postscript eps enhanced color"
echo "set terminal png enhanced font 'Verdana,10'"
dir=`pwd`
echo "set output '$dir/$name1-vs-$name2-big.png'"
echo "replot"

#rm $tmp



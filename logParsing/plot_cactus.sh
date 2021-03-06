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
tmp="$name1-vs-$name2-cactus.csv"
join -o"1.1 1.2 2.2 1.$c1 2.$c2" $file1 $file2 > $tmp

offset=10000

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
echo "set size ratio 1.3"
#echo "set key outside left top"
#echo "set key right top vertical reverse"
echo "set key off"
echo "set logscale x"
#echo "set logscale y"
#echo "set title \"Total Time\""

echo "f(x)=x"
echo "g(x)=10*x"
echo "h(x)=x/10"
echo "xout=$border"

echo "set datafile separator ' '"

t1=$(echo $file1 | cut -d"_" -f2 | cut -d"." -f1)
t2=$(echo $file2 | cut -d"_" -f2 | cut -d"." -f1)
echo "set xlabel 'runtime in s' rotate by 180"
echo "set y2label '# solved instances' offset -3,0"
#echo "set label 1 'runtime in s' at graph 0.5, -0.7 centre rotate by 180"

echo "set xrange [$max:$offset] reverse"
echo "set yrange [14500:16000]"

echo "set xtic rotate by 90 scale 0 offset 0,-1.7"
echo "unset ytics"
echo "set y2tics rotate by 90"

echo 'set xtics ("10⁻³" 1, "0.01" 10, "0.1" 100, "1" 1000, "10" 10000, "100" 100000, "1000" 1000000)'
echo 'set y2tics ("10000" 10000, "11000" 11000,"12000" 12000, "13000" 13000, "14000" 14000, "15000" 15000)'

echo "a=0"
echo "b=0"
echo "cumulative_sum_1(x)=(a=a+x,a)"
echo "cumulative_sum_2(x)=(b=b+x,b)"

echo "binwidth=10"
echo "bin(x,width)=floor(x/width)"

echo "set style line 1 lt 1 lw 1 lc rgb '#fbb252'"


#echo "plot xout ls 1 notitle"
#echo "replot '< sort -n -k4 $tmp' u (!(strcol(2) eq 'UNKNOWN')) ? \$4:(1/0):cumulative_sum_1(1) title '$t1' lc rgb '#ff0000' pt 3"
#echo "replot '< sort -g -k5 $tmp' u (!(strcol(3) eq 'UNKNOWN')) ? \$5:cumulative_sum_2(1) title '$t2' lc rgb '#00ff00' with lines"

echo "plot '$tmp' using 4:(1.0) title '$t1' smooth cumulative, '' using 5:(1.0) title '$t2' smooth cumulative"
echo "set label 2 'Boolector' at graph 0.9, 0.8 left rotate by 90 tc lt 1"
echo "set label 3 'Ablector' at graph 0.85, 0.8 left rotate by 90 tc lt 2"
# echo "set arrow from $border,$offset to $border,$scale_border nohead ls 1"

# echo "replot '$tmp' u (strcol(2) eq strcol(3) && !(strcol(2) eq 'UNKNOWN')) ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'solved by both' with points lc rgb '#000000' pt 3" #black

# echo "replot '$tmp' u (strcol(2) eq 'UNKNOWN' && !(strcol(2) eq strcol(3)))   ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'only solved by $t2' with points lc rgb '#4cb5a7' pt 2" #green
# echo "replot '$tmp' u (strcol(3) eq 'UNKNOWN' && !(strcol(2) eq strcol(3)))     ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'only solved by $t1' with points lc rgb '#e6bc61' pt 4" #red

# echo "replot '$tmp' u (strcol(2) eq strcol(3) && strcol(2) eq 'UNKNOWN') ? (\$4<${offset}?${offset}:\$4) : (1/0) : (\$5<${offset}?${offset}:\$5) title 'unknown to both' with points lc rgb '#7d92cb' pt 1" #blue

# echo "replot f(x) lc rgb '#ff00ff' lt 1 lw 1 notitle"
# echo "replot g(x) lc rgb '#ff00ff' lt 2 lw 1 notitle"
# echo "replot h(x) lc rgb '#ff00ff' lt 2 lw 1 notitle"


#echo "set terminal postscript eps enhanced color"
echo "set terminal png enhanced font 'Verdana,14' size 600,600"

dir=`pwd`
echo "set output '$dir/$name1-vs-$name2-cactus.png'"
echo "replot"

#rm $tmp



#! /bin/bash
CALL_CWD=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function newDir {
    cd $CALL_CWD
    if [ -d "$1" ]
    then
        return 1 # false
    else
        mkdir -p $1
        cd $1
        return 0 # true
    fi
}

function compare {
    F1=$1
    F2=$4
    python $DIR/buildCsv.py $3 $DIR/../Logs/$2 | sort > $1.csv
    python $DIR/buildCsv.py $6 $DIR/../Logs/$5 | sort > $4.csv
    shift 6
    while (( "$#" )); do
        $DIR/plot_new.sh $F2.csv $F1.csv $1 | gnuplot
        mv $F2-vs-$F1.png $F2-vs-$F1-$1.png
        mv $F2-vs-$F1.csv $F2-vs-$F1-$1.csv
        shift
    done
    return 0
}

function buildHist {
    python $DIR/histData.py $3 $4 $DIR/../Logs/$1 $2 level-$2.csv bit-$2.csv
    $DIR/plot_hist.sh 3 level-$2.csv | gnuplot
    $DIR/plot_hist.sh 3 bit-$2.csv | gnuplot
}
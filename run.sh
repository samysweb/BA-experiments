echo "[runner] $1"
runlim -r $TO -s "$(($MEM/4))" $BIN $ARGS $1
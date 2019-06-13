echo "[runner] $1"
source $(echo $SOURCE_SCRIPT)
runlim -r $TO -s "$(($MEM/4))" $BIN $ARGS $1
echo "[runner] $1"
source $(echo $SOURCE_SCRIPT)
runlim -r $TO -s "$(($MEM/$PAR_NUM))" $BIN $1 $ARGS
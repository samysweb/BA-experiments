#! /bin/bash

CUR_PATH=`pwd`

exec 6>&1 7>&2

cd $SOFTWARE_PATH

exec &> $LOG_DIR/init.log

echo "******* Information on experiment repository ******* "
git --no-pager show --pretty=short --shortstat
git --no-pager status
echo ""

echo "******* Information on software packages in $SOFTWARE_PATH ******* "
for D in `find . -maxdepth 1 -type d`
do
    cd $SOFTWARE_PATH/$D
    echo "******* Information on repository $D ******* "
    git --no-pager show --pretty=short --shortstat
    git --no-pager status
    echo ""
done

cd $CUR_PATH
exec 1>&6 2>&7 6>&- 7>&-
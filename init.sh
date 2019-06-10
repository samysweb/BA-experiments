#! /bin/bash

CUR_PATH=`pwd`

exec 6>&1 7>&2

exec &> $LOG_DIR/machine-$JOB_ID.log
echo "******* Machine details *******"
echo "$ lscpu"
lscpu
echo "$ cat /proc/meminfo"
cat /proc/meminfo
echo "$ cat /proc/version"
cat /proc/version
echo "$ lsblk"
lsblk

cd $SOFTWARE_PATH

exec &> $LOG_DIR/init-$JOB_ID.log

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
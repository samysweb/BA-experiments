#! /bin/bash

cd $SOFTWARE_PATH

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
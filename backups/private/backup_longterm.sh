#!/bin/bash
s_pwd=`pwd`
source ../global.sh
cd $s_pwd
if [ -z ${PRIVATE_DATA_DIR+x} ]
then
    echo "failed to import global.sh <br/>";
    echo "pwd: <br/>"
    echo `pwd`
    echo "<br/>"
    exit
fi

cd $PRIVATE_DATA_DIR

mkdir -p longterm_accounts
while :
do
    echo "[$(date +%F_%H-%M-%S)] backup longterm..."
    cp accounts.db longterm_accounts/accounts_tmp_$(date +%F_%H-%M-%S).db
    # delete files older than 500 days
    find longterm_accounts/ -name "accounts_tmp_*.db" -mtime +500 -type f -delete
    sleep 30d
done


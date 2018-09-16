#!/bin/bash
s_pwd=`pwd`
source ../global.sh
cd $s_pwd
cd ../chillerbot-FC/
if [ "$USER" != "$DDPP_USER" ]
then
    echo "Error: you=$USER != ddpp=$DDPP_USER"
    exit
fi

./cb_restart.sh

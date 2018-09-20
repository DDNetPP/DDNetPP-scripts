#!/bin/bash
source ../../global.sh
if [ -z ${WEB_TEST_PATH+x} ]
then 
    echo "failed to import global.sh <br/>";
    echo "pwd: <br/>"
    echo `pwd`
    echo "<br/>"
    exit
fi
cd $WEB_TEST_PATH


mkdir -p logs
echo "deleting on database and stopping server<br/>"
rm test.db
./stop.sh
echo "<br/>starting server...<br/>"
nohup ./web_test_srv_d > logs/test.log 2>&1 &

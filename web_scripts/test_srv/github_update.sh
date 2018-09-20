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

echo "fetching and building<br/>"
cd /home/chiller/git/DDNetPP;
git pull;
./bam server_debug
echo "updating test binary (debug)...<br/>";
cp DDNetPP_d $WEB_TEST_PATH/web_test_srv_d
echo "updating maps folder:<br/>"
mkdir -p $WEB_TEST_PATH/maps
cp maps/* $WEB_TEST_PATH/maps
ls maps/
echo "<br/>"
echo "done.<br/>"

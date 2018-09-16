#!/bin/bash

cd /home/chiller/test_cb/;
nohup ./chillerbotFC "149.202.127.134:8304" "./cb_stop.sh;./cb_start.sh > /dev/null 2>&1 &" > /dev/null 2>&1 &


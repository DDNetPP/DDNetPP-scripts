#!/bin/bash
#This is a script which starts chillerbot.png (FC version)
#And runs the bot with nohup
#The bot connects to the server and executes the restart command if the connection failed

#parameters:
#para1 = ip
#para2 = command (which gets executed in bash on connection loose)

cd /home/chiller/test_cb/;
nohup ./chillerbotFC_test "149.202.127.134:8304" "./test_stop.sh;./test_start.sh > /dev/null 2>&1 &" > /dev/null 2>&1 &

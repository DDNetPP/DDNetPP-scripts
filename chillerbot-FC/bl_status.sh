#!/bin/bash
#this script gives the status of chillerbot.png (FC version)
#which keeps the servers alive

echo "=== STATUS ===";
ps -ef | grep "./chillerbotFC_bl";
echo "==============";

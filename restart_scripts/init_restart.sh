#!/bin/bash
echo "[+] starting..."
cd /home/chiller/ddpp_database/restart_scripts/;
#nohup ./restart_BlmapChill.sh > /dev/null 2>&1 &
#nohup ./restart_BlmapChill.sh > status_restart_BlmapChill_$(date +%F_%H-%M-%S).log 2>&1 &
#nohup ./restart_chillblock.sh > status_restart_chillblock_$(date +%F_%H-%M-%S).log 2>&1 &

echo "==== $(date +%F_%H-%M-%S) ====" > status_restart_BlmapChill.log
echo "BlmapChill" >> status_restart_BlmapChill.log
echo "==============================" >> status_restart_BlmapChill.log
nohup ./restart_BlmapChill.sh >> status_restart_BlmapChill.log 2>&1 &

echo "==== $(date +%F_%H-%M-%S) ====" > status_restart_chillblock.log
echo "ChillBlock5" >> status_restart_chillblock.log
echo "==============================" >> status_restart_chillblock.log
nohup ./restart_chillblock.sh >> status_restart_chillblock.log 2>&1 &

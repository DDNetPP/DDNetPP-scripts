#!/bin/bash
s_pwd=`pwd`
source ../global.sh
cd $s_pwd
echo "[-] stopping..."
pkill -f ./restart_BlmapChill.sh
pkill -f ./restart_chillblock.sh
../exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "[RESTART] stopped restart script."
../exp_rcon_api/say_exp_server.exp $EC_CHILLBLOCK_PASS $EC_CHILLBLOCK_PORT "[RESTART] stopped restart script"


echo "==== $(date +%F_%H-%M-%S) ====<br/>" > status_restart_BlmapChill.log
echo "BlmapChill<br/>" >> status_restart_BlmapChill.log
echo "==============================<br/>" >> status_restart_BlmapChill.log
echo "canceled restart<br/>" >> status_restart_BlmapChill.log

echo "==== $(date +%F_%H-%M-%S) ====<br/>" > status_restart_chillblock.log
echo "ChillBlock5<br/>" >> status_restart_chillblock.log
echo "==============================<br/>" >> status_restart_chillblock.log
echo "canceled restart<br/>" >> status_restart_chillblock.log


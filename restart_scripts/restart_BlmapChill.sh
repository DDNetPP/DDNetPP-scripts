#!/bin/bash
source ../global.sh
print_str="$*"
#echo "printing $print_str";
#../exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "$print_str"
#../exp_rcon_api/say_exp_server.exp $EC_CHILLBLOCK_PASS $EC_CHILLBLOCK_PORT "$print_str"



function save_sleep () {
    time=$1
    if [ $time -lt 0 ]
    then
        echo "[-] time already passed for $time seconds"
        return 0
    fi
    echo "[+] sleeping for $time seconds"
    sleep $time
    ../exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "[WARNING] Server will be restarted today at 23:59"
}



#init
../exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "[RESTART] Script successfully started. Server will be restarted tonight."



#for testing purpose if the script can be called after these times
echo "[+] sleep until 10:00 seconds: $(($(date -f - +%s- <<< $'today 10:00\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 10:00\nnow')0))

#for testing if the script prints the messaeg properly
echo "[+] sleep until 12:05 seconds: $(($(date -f - +%s- <<< $'today 12:05\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 12:05\nnow')0))


echo "[+] sleep until 20:00 seconds: $(($(date -f - +%s- <<< $'today 20:00\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 20:00\nnow')0))
echo "[+] sleep until 21:00 seconds: $(($(date -f - +%s- <<< $'today 21:00\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 21:00\nnow')0))
echo "[+] sleep until 22:00 seconds: $(($(date -f - +%s- <<< $'today 22:00\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 22:00\nnow')0))
echo "[+] sleep until 23:00 seconds: $(($(date -f - +%s- <<< $'today 23:00\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 23:00\nnow')0))
echo "[+] sleep until 23:30 seconds: $(($(date -f - +%s- <<< $'today 23:30\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 23:30\nnow')0))
echo "[+] sleep until 23:40 seconds: $(($(date -f - +%s- <<< $'today 23:40\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 23:40\nnow')0))
echo "[+] sleep until 23:50 seconds: $(($(date -f - +%s- <<< $'today 23:50\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 23:50\nnow')0))
echo "[+] sleep until 23:59 seconds: $(($(date -f - +%s- <<< $'today 23:59\nnow')0))"
save_sleep $(($(date -f - +%s- <<< $'today 23:59\nnow')0))

../exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "[WARNING] SERVER RESTART! Just reconnect 20 sec after shutdown."
../exp_rcon_api/broadcast_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "---> SERVER RESTART <---"
#../exp_rcon_api/shtudown_exp_server.exp pw port "[WARNING] Restarting..."
cd /home/chiller/ddpp_database/chillerbot-FC/;
./bl_restart.sh;

#######################################
# OLD unused date stuff               #
# it doesnt work .-.                  #
# i keep it because it was much work  #
#######################################

#current_epoch=$(date +%s)
#current_day=`date +%Y/%m/%d`
#echo "current day: $current_day"
#target_time="$current_day 12:00"
#echo "targettime: $target_time"
#
#target_time="2018/06/07 12:00"
#
#target_epoch=$(date -d '$target_time' +%s)
##target_epoch=$(date -d '2018/06/07 12:00' +%s)
#
#echo "target epoch: $target_epoch"
#
#sleep_seconds=$(( $target_epoch - $current_epoch ))
#
#echo "12:00 is in $sleep_seconds seconds"
#
#sleep $sleep_seconds

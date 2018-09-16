#!/bin/bash
source global.sh
print_str="$*"
#echo "printing $print_str";
exp_rcon_api/say_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "$print_str"
exp_rcon_api/say_exp_server.exp $EC_CHILLBLOCK_PASS $EC_CHILLBLOCK_PORT "$print_str"

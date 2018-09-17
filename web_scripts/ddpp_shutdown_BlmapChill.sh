#!/bin/bash
s_pwd=`pwd`
source ../global.sh
cd $s_pwd
# Arg(1)=Hour
# Arg(2)=Value(0=off/1=on)
# script.exp pass port hour value(0/1)

../exp_rcon_api/ddpp_shutdown_exp_server.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT $1 $2

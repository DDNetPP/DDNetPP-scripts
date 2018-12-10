#!/bin/bash
mkdir -p donors
echo "== Add a donor =="

read -p "sqlid> " sqlid
read -p "accname> " accname
read -p "rank> " rank
read -p "ingame> " ingame

echo $sqlid > donors/$(date +%F)_$sqlid.txt
echo $accname >> donors/$(date +%F)_$sqlid.txt
echo $rank >> donors/$(date +%F)_$sqlid.txt
echo $ingame >> donors/$(date +%F)_$sqlid.txt

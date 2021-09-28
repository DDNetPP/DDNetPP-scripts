#!/bin/bash
mkdir -rp donors
echo "== Add a donor =="

read -rp "sqlid> " sqlid
read -rp "accname> " accname
read -rp "rank> " rank
read -rp "ingame> " ingame

{
	echo "$sqlid"
	echo "$accname"
	echo "$rank"
	echo "$ingame"
} > "donors/$(date +%F)_$sqlid.txt"


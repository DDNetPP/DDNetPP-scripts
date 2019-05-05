#!/bin/bash

psaux=`ps aux`
ishtml=0
if [ "$1" == "html" ]
then
	ishtml=1
fi

function html_success() {
	echo "<div>[<span style=\"color: green\">RUNNING</span>] $1</div>"
}

function html_fail() {
	echo "<div>[<span style=\"color: red\">DOWN</span>] $1</div>"
}

function c_green() {
	printf "\e[1;32m%s\e[0m" "$1"
}

function c_red() {
	printf "\e[1;31m%s\e[0m" "$1"
}

function proc_status() {
	local procname=$1
	if echo $psaux | grep $procname | grep -qv grep;
	then
		if [ "$ishtml" == "1" ]
		then
			html_success $procname
		else
			printf "["; c_green "+";printf "] $procname\n";
			# c_green .
		fi
	else
		if [ "$ishtml" == "1" ]
		then
			html_fail $procname
		else
			printf "["; c_red "-";printf "] $procname\n";
		fi
	fi
}

while read line
do
	proc_status $line
done < status.private


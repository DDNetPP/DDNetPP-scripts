#!/bin/bash

status_file=status.private
psaux="$(ps aux)"
ishtml=0
if [ "$1" == "html" ]
then
	ishtml=1
fi

if [ ! -f "$status_file" ]
then
	echo "ERROR '$status_file' file not found."
	echo "Make sure it is created and you executed the script from the correct directory."
	exit
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
	if echo "$psaux" | grep "$procname" | grep -qv grep;
	then
		if [ "$ishtml" == "1" ]
		then
			html_success "$procname"
		else
			printf "["; c_green "+";printf "] %s\\n" "$procname";
			# c_green .
		fi
	else
		if [ "$ishtml" == "1" ]
		then
			html_fail "$procname"
		else
			printf "["; c_red "-";printf "] %s\\n" "$procname";
		fi
	fi
}

while read -r line
do
	proc_status "$line"
done < "$status_file"


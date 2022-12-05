#!/bin/bash

Reset='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'

PRIVATE_FILE=status.private
PUBLIC_FILE=status.public
psaux="$(ps aux)"
ishtml=0
isslim=0

if [[ "$1" == "help" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]
then
    echo "usage: $(basename "$0") [ARG]"
    echo "args:"
    echo "  help - shows this help"
    echo "  html - prints html version"
    echo "  slim - prints light weight cli version"
    exit 0
elif [[ "$1" == "html" ]] || [[ "$1" == "--html" ]]
then
	ishtml=1
elif [[ "$1" == "slim" ]] || [[ "$1" == "--slim" ]]
then
    isslim=1
fi

if [ ! -f "$PUBLIC_FILE" ]
then
	echo "ERROR '$PUBLIC_FILE' file not found."
	echo "Make sure it is created and you executed the script from the correct directory."
	exit
fi

function html_success() {
    local proc=$1
    local slots=$2
    color=green
    if [ "$slots" == "0/0" ]
    then
        color=red
    fi
	echo -n "<div>"
    echo -n "[<span style=\"color: green\">RUNNING</span>] $proc <strong style=\"color: $color\">$slots</strong>"
    echo -n "</div>"
}

function html_fail() {
	echo "<div>[<span style=\"color: red\">DOWN</span>] $1</div>"
}

function proc_status() {
	local procname=$1
    local slots=$2
	if [[ "$procname" =~ extern_* ]] || echo "$psaux" | grep "$procname" | grep -qv grep;
	then
		if [ "$ishtml" == "1" ]
		then
			html_success "$procname" "$slots"
		else
            if [ "$isslim" == "0" ]
            then
                if [ "$slots" == "0/0" ]
                then
                    printf "[%b+%b] %s %b%s%b" \
                        "$Green" "$Reset" "$procname" "$Red" "$(tput bold)$slots$(tput sgr0)" "$Reset";
                else
                    printf "[%b+%b] %s %s" "$Green" "$Reset" "$procname" "$(tput bold)$slots$(tput sgr0)";
                fi
            else
                printf "%b.%b" "$Green" "$Reset"
            fi
		fi
	else
		if [ "$ishtml" == "1" ]
		then
			html_fail "$procname"
		else
			printf "[%s-%s] %s" "$Red" "$Reset" "$procname";
		fi
	fi
}

STATUSTW_API='https://api.status.tw/2.0/server/list/'

function is_cached() {
    local file=$1
    local last
    local diff
    local linenum
    now="$(date '+%s')"
    if [ ! -f "$file" ]
    then
        echo "$now" > "$file"
        return 1
    fi
    last="$(head -n1 "$file")"
    if [[ ! "$last" =~ ^[0-9]*$ ]]
    then
        echo "$now" > "$file"
        return 1
    fi
    linenum="$(wc -l "$file" | cut -d' ' -f1)"
    if [[ "$linenum" -lt "2" ]]
    then
        echo "$now" > "$file"
        return 1
    fi
    diff="$((now - last))"
    if [ "$diff" -gt "60" ]
    then
        echo "$now" > "$file"
        return 1
    fi
    return 0
}

function twip_status() {
    local twip=$1
    local ip
    local port
    local num_clients
    local max_clients
    local cache_file
    if [ "$twip" == "" ]
    then
        return
    fi
    if [[ "$twip" =~ ^[0-9\.:]$ ]]
    then
        echo "Error: invalid ip '$twip'"
        return
    fi
    ip="$(echo "$twip" | cut -d':' -f1)"
    port="$(echo "$twip" | cut -d':' -f2)"
    cache_file="/tmp/ddpp_status_req_$ip-$port.txt"
    if ! is_cached "$cache_file"
    then
        curl --silent "$STATUSTW_API?ip=$ip&port=$port" >> "$cache_file"
        echo "" >> "$cache_file"
    fi
    num_clients="$(sed -n '2,$p' "$cache_file" \
        | jq '.["servers"][]."num_clients"')"
    max_clients="$(sed -n '2,$p' "$cache_file" \
        | jq '.["servers"][]."max_clients"')"
    printf "%d/%d" "$num_clients" "$max_clients"
}

function cat_files() {
    if [ -f "$PUBLIC_FILE" ]
    then
        awk NF "$PUBLIC_FILE"
    fi
    if [ -f "$PRIVATE_FILE" ]
    then
        awk NF "$PRIVATE_FILE"
    fi
}

while read -r line
do
    if [ "${line:0:1}" == "#" ]
    then
        continue
    fi
    procname="$(echo "$line" | awk '{ print $1 }')"
    arg="$(echo "$line" | awk '{$1=""; print substr($0,2)}')"
    if [ "$isslim" == "0" ]
    then
        if [ "${arg:0:1}" == "$" ] # shell command
        then
            slots="$(eval "${arg:1}")"
        else # teeworlds ip
            slots="$(twip_status "$arg")"
        fi
    fi
	proc_status "$procname" "$slots"
    if [ "$isslim" == "0" ]
    then
        echo ""
    fi
done < <(cat_files)
echo ""


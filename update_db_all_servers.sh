#!/bin/bash
source global.sh

posY=0
menu_size=5
print_str="error"

function ExecuteApi() {
    stty sane
	clear

    if [ "$posY" -eq  0 ]
    then
            echo "(x) INTEGER";
    elif [ "$posY" -eq  1 ]
    then
            echo "(x) VARCHAR(4)";
    elif [ "$posY" -eq  2 ]
    then
            echo "(x) VARCHAR(16)";
    elif [ "$posY" -eq  3 ]
    then
            echo "(x) VARCHAR(32)";
    elif [ "$posY" -eq  4 ]
    then
            echo "(x) VARCHAR(64)";
    elif [ "$posY" -eq  5 ]
    then
            echo "(x) VARCHAR(128)";
    else
            echo "error";
            EndScript
    fi

    read -p "variable_name: " var_name
    print_str="$posY"
	print_str+=" $var_name"
	echo "$print_str"

    echo "[EXECUTING] rcon_api_alter_table $print_str";
    # Only one server needed because they share one db
    exp_rcon_api/update_exp_db.exp $EC_BLMAPCHILL_PASS $EC_BLMAPCHILL_PORT "$print_str"
	echo "===================";
	echo "done."
	EndScript
}


function EndScript() {
        stty sane
        exit
}


function menu() {
while true;
do

	stty -icanon time 0 min 0
	read -s input
	stty sane

	if [ "$input" = "w" ] && [ "$posY" -gt 0 ]; then
		posY=$((posY - 1))
	elif [ "$input" = "s" ] && [ "$posY" -lt "$menu_size" ]; then
		posY=$((posY + 1))
	elif [ "$input" = "q" ]; then
		EndScript
        elif [ "$input" = "e" ]; then
                ExecuteApi
	fi

	clear
	echo "============= ddpp++ alter sql table ==============";
	echo "only touch this script if you know what you do";
	echo "press (q) to quit and (e) so select";
	echo "(w) and (s) to move selection marker";
	echo "===================================================";
	if [ "$posY" -eq  0 ]
	then
		echo "(x) INTEGER";
		echo "( ) VARCHAR(4)";
                echo "( ) VARCHAR(16)";
                echo "( ) VARCHAR(32)";
                echo "( ) VARCHAR(64)";
                echo "( ) VARCHAR(128)";
	elif [ "$posY" -eq  1 ]
	then
                echo "( ) INTEGER";
                echo "(x) VARCHAR(4)";
                echo "( ) VARCHAR(16)";
                echo "( ) VARCHAR(32)";
                echo "( ) VARCHAR(64)";
                echo "( ) VARCHAR(128)";
        elif [ "$posY" -eq  2 ]
        then
                echo "( ) INTEGER";
                echo "( ) VARCHAR(4)";
                echo "(x) VARCHAR(16)";
                echo "( ) VARCHAR(32)";
                echo "( ) VARCHAR(64)";
                echo "( ) VARCHAR(128)";
        elif [ "$posY" -eq  3 ]
        then
                echo "( ) INTEGER";
                echo "( ) VARCHAR(4)";
                echo "( ) VARCHAR(16)";
                echo "(x) VARCHAR(32)";
                echo "( ) VARCHAR(64)";
                echo "( ) VARCHAR(128)";
        elif [ "$posY" -eq  4 ]
        then
                echo "( ) INTEGER";
                echo "( ) VARCHAR(4)";
                echo "( ) VARCHAR(16)";
                echo "( ) VARCHAR(32)";
                echo "(x) VARCHAR(64)";
                echo "( ) VARCHAR(128)";
        elif [ "$posY" -eq  5 ]
        then
                echo "( ) INTEGER";
                echo "( ) VARCHAR(4)";
                echo "( ) VARCHAR(16)";
                echo "( ) VARCHAR(32)";
                echo "( ) VARCHAR(64)";
                echo "(x) VARCHAR(128)";
	else
		echo "error";
		EndScript
	fi
done
}


menu

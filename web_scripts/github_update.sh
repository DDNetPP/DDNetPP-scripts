#!/bin/bash
source ../global.sh
echo "----------------------------------"
echo " ---> GITHUB <---"
echo "ChillerDragon's mod update script (debug)"
echo "chillblock_srv_d (chillblock5)"
echo "BlmapChill_srv_d (BlmapChill)"
echo "----------------------------------"
echo "Server keeps running"

if [ "$USER" != "$DDPP_USER" ]
then
    echo "Error: you=$USER != ddpp=$DDPP_USER"
    exit
fi

# yes | ./github_update.sh
# does not work because some newlines get interpreted as default N
# so we have to spam only y without newlines
# while true;do printf "y";done | ./github_update.sh
# didn't work either somehow the whole website hung up lol

cd $CB_PATH
./github_update.sh -y

cd $BL_PATH
./github_update.sh -y


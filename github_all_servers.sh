#!/bin/bash
echo "----------------------------------"
echo " ---> GITHUB <---"
echo "ChillerDragon's mod update script (debug)"
echo "chillblock_srv_d (chillblock5)"
echo "BlmapChill_srv_d (BlmapChill)"
echo "----------------------------------"
echo "This script fetches the new source from github and builds it."
echo "Then it updates the binarys of all main servers"
echo "Server keeps running"
read -p "Do you really want to run it? Write 'n' to abort" inp
if [ "$inp" == "n" ]; then
exit
elif [ "$inp" == "N" ]; then
exit
elif [ "$inp" == "No" ]; then
exit
elif [ "$inp" == "no" ]; then
exit
elif [ "$inp" == "NO" ]; then
exit
fi

clear

echo "===================================="
echo "            W A R N I N G "
echo "          Powerfull script"
echo "only touch if you know what ur doing"
echo "====================================="
echo ""

read -p "Do you really want to run it? Write 'n' to abort" inp
if [ "$inp" == "n" ]; then
exit
elif [ "$inp" == "N" ]; then
exit
elif [ "$inp" == "No" ]; then
exit
elif [ "$inp" == "no" ]; then
exit
elif [ "$inp" == "NO" ]; then
exit
fi

#fetch and build
cd;
cd DDNetPP/;
git pull;
./bam server_debug

#update binarys
#cb5
cd;
cd chillblock/;
./github_update.sh
#blchill
cd;
cd BlmapChill/;
./github_update.sh

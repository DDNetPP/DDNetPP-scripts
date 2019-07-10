#!/bin/bash
source ../global.sh
echo "----------------------------------<br/>"
echo " ---> GITHUB <---<br/>"
echo "ChillerDragon's mod update script (debug)<br/>"
echo "chillblock_srv_d (chillblock5)<br/>"
echo "BlmapChill_srv_d (BlmapChill)<br/>"
echo "----------------------------------<br/>"
echo "This script fetches the git/DDNetPP/server and replaces the chillblock/server"
echo "Server keeps running<br/>"

if [ "$USER" != "$DDPP_USER" ]
then
    echo "Error: you=$USER != ddpp=$DDPP_USER"
    exit
fi

# BUILD
echo "[SRC] fetch and build new source<br/>"
cd $SRC_PATH
git pull
git submodule update
./bam server_debug
echo "<br/>"

# BACKUP
echo "[BACKUP] BlmapChill server<br/>"
cd $BL_PATH;
mv BlmapChill_srv_d BlmapChill_srv_d_old

echo "[BACKUP] chillblock server<br/>"
cd $CB_PATH;
mv chillblock_srv_d chillblock_srv_d_old

# UPDATE

echo "[UPDATE] BlmapChill server<br/>"
cd $BL_PATH;
cp $SRC_PATH/DDNetPP_d BlmapChill_srv_d

echo "[UPDATE] chillblock server<br/>"
cd $CB_PATH;
cp $SRC_PATH/DDNetPP_d chillblock_srv_d

echo "[UPDATE] maps BlmapChill<br/>"
cp $SRC_PATH/maps/* $BL_PATH/maps/
echo "[UPDATE] maps chillblock<br/>"
cp $SRC_PATH/maps/* $CB_PATH/maps/

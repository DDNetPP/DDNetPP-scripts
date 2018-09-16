#!/bin/bash
cd /home/chiller/ddpp_database # so the secrets import dont cause trobo
source secrets.sh

ddpp_user=$USER
DDPP_USER=chiller

EC_CHILLBLOCK_PORT=1333
EC_CHILLBLOCK_PASS=$SECRET_EC_CHILLBLOCK_PASS # secrets.sh

EC_BLMAPCHILL_PORT=1336
EC_BLMAPCHILL_PASS=$SECRET_EC_BLMAPCHILL_PASS # secrets.sh

CB_PATH=/home/$ddpp_user/chillblock
BL_PATH=/home/$ddpp_user/BlmapChill
SRC_PATH=/home/$ddpp_user/git/DDNetPP

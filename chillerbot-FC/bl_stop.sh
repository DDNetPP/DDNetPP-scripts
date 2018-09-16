#!/bin/bash
#this stops the chillerbot.png (FC version)
#he is keeping alive the test server

#kill the client
pkill -f chillerbotFC_bl

#kill the server
pkill -f ./BlmapChill_srv_d
#pkill -f "/home/chiller/BlmapChill/BlmapChill_srv_d"

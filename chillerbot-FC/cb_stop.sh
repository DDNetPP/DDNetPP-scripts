#!/bin/bash
#this stops the chillerbot.png (FC version)
#he is keeping alive the test server

#kill the client
pkill -f chillerbotFC_cb

#kill the server
pkill -f ./chillblock_srv_d
#pkill -f "/home/chiller/chillblock/chillblock_srv_d"

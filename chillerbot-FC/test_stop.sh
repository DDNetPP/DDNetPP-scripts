#!/bin/bash
#this stops the chillerbot.png (FC version)
#he is keeping alive the test server

#kill the client
pkill -f chillerbotFC_test

#kill the server
pkill -f ./DDNet-Server_d
#pkill -f "sh /home/chiller/test_cb/DDNet-Server_d"


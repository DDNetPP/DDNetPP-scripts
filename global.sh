#!/bin/bash
cd /home/chiller/ddpp_database # so the secrets import dont cause trobo
source secrets.sh

EC_CHILLBLOCK_PORT=1333
EC_CHILLBLOCK_PASS=$SECRET_EC_CHILLBLOCK_PASS # secrets.sh

EC_BLMAPCHILL_PORT=1336
EC_BLMAPCHILL_PASS=$SECRET_EC_BLMAPCHILL_PASS # secrets.sh

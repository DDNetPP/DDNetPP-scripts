#!/bin/bash
mkdir -p longterm_accounts
while :
do
    cp ../accounts.db longterm_accounts/accounts_tmp_$(date +%F_%H-%M-%S).db
    #delete files older than 100 days
    find longterm_accounts/ -name "accounts_tmp_*.db" -mtime +100 -type f -delete
    sleep 6h
done


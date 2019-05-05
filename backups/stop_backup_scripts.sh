#!/bin/bash
echo "[ - ] Stopping all 3 scripts"
pkill -f ./private/backup_accounts.sh
pkill -f ./private/backup_longterm.sh
pkill -f ./public/backup_records.sh
echo "[ - ] Done stopping."

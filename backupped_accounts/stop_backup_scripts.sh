#!/bin/bash
echo "[ - ] Stopping all 3 scripts"
pkill -f ./backup_accounts.sh
pkill -f ./backup_longterm.sh
pkill -f ./backup_records.sh
echo "[ - ] Done stopping."

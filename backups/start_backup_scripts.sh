#!/bin/bash
mkdir -p logs
./stop_backup_scripts.sh
nohup ./private/backup_accounts.sh > logs/acc_backup.log 2>&1 &
nohup ./private/backup_longterm.sh > logs/long_backup.log 2>&1 &
nohup ./public/backup_records.sh > logs/rec_backup.log 2>&1 &
echo "==================";
echo "backup_accounts.sh";
echo "backup_longterm.sh";
echo "backup_records.sh";
echo "now running with";
echo "nohup";
echo "==================";

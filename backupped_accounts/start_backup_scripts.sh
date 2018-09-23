#!/bin/bash
./stop_backup_scripts.sh
nohup ./backup_accounts.sh > /dev/null 2>&1 &
nohup ./backup_longterm.sh > /dev/null 2>&1 &
nohup ./backup_records.sh > rec_backup.log 2>&1 &
echo "==================";
echo "backup_accounts.sh";
echo "backup_longterm.sh";
echo "backup_records.sh";
echo "now running with";
echo "nohup";
echo "==================";

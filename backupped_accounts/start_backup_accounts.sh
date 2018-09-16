#!/bin/bash
nohup ./backup_accounts.sh > /dev/null 2>&1 &
nohup ./backup_longterm.sh > /dev/null 2>&1 &
echo "==================";
echo "backup_accounts.sh";
echo "backup_longterm.sh";
echo "now running with";
echo "nohup";
echo "==================";

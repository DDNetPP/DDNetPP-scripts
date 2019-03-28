#!/bin/bash
echo "Use: ";
echo "kill (process id)";
echo "to kill the script";
echo "the process id is the first num after the user:";
echo "==========================";
ps -ef | grep -v "grep" | grep "./backup_accounts.sh";
ps -ef | grep -v "grep" | grep "./backup_longterm.sh";
ps -ef | grep -v "grep" | grep "./backup_records.sh"

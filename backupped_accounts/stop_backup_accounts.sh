#!/bin/bash
echo "Use: ";
echo "kill (process id)";
echo "to kill the script";
echo "the process id is the first num after the user:";
echo "==========================";
ps -ef | grep "./backup_accounts.sh";
ps -ef | grep "./backup_longterm.sh";

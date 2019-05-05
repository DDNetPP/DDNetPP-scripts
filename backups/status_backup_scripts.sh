#!/bin/bash
echo "Use: ";
echo "kill (process id)";
echo "==========================";
ps -ef | grep -v "grep" | grep "./private/backup_accounts.sh";
ps -ef | grep -v "grep" | grep "./private/backup_longterm.sh";
ps -ef | grep -v "grep" | grep "./public/backup_records.sh"
echo "==========================";

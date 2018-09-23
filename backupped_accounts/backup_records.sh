#!/bin/bash
s_pwd=`pwd`
source ../global.sh
cd $s_pwd
if [ -z ${CB_REC_FILE+x} ] || [ -z ${BL_REC_FILE+x} ]
then
    echo "failed to import global.sh <br/>";
    echo "pwd: <br/>"
    echo `pwd`
    echo "<br/>"
    exit
fi

mkdir -p backup_records
while :
do
    echo "+-------------------------+"
    echo "|  backup_records         |"
    echo "|  creating new backup... |"
    echo "+-------------------------+"
    echo "TIMESTAMP: $(date +%F_%H-%M-%S)"

    ################
    #  ChillBlock  #
    ################
    echo "[ * ] Starting backup ChillBlock"
    cp $CB_REC_FILE backup_records/records_chillblock_$(date +%F_%H-%M-%S).dtb_save
    #delete files older than 30 days
    find backup_records/ -name "accounts_chillblock_*.dtb_save" -mtime +30 -type f -delete
    echo "[ OK ] done."

    ################
    #  BlmapChill  #
    ################
    echo "[ * ] Starting backup BlmapChill"
    cp $BL_REC_FILE backup_records/records_BlmapChill_$(date +%F_%H-%M-%S).dtb_save
    #delete files older than 30 days
    find backup_records/ -name "accounts_BlmapChill_*.dtb_save" -mtime +30 -type f -delete
    echo "[ OK ] done."

    #sleep backup rave repeat
    echo "[ SLEEP ] waiting 6 hours for next backup"
    sleep 6h
done


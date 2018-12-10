#!/bin/bash
function donor_stats() {
    time_start=$1
    start_ts=$(date -d "$time_start" '+%s')
    end_ts=$(date -d "$time_start +60 days" '+%s')
    time_end=$(date -d "@$end_ts" +%F)

    printf "[$time_start - $time_end]"
    printf " id: $2"
    echo " days left [$(( ( end_ts - start_ts)/(60*60*24) ))]"
}

mkdir -p donors
echo "== donors status =="

for donor in donors/*.txt;
do
    d_date=${donor:7:10}
    d_id=${donor:18}
    d_id=${d_id::${#d_id}-4}
    #echo $donor
    #echo "date: $d_date"
    #echo "id: $d_id"
    donor_stats $d_date $d_id
done

#!/bin/bash

rm -rf data # clean out data folder and creat a new one
mkdir data

start=$1
end=$2

for i in $@; do
    if [ $i -gt 2020 ]; then 
        echo "invalid argument: year must be in the range of 2009-2020" 1>&2
        exit 1 
    elif [ $i -lt 2009 ]; then
        echo "invalid argument: year must be in the range of 2009-2020" 1>&2
        exit 1
    else
        echo "Valid ranges"
    fi
done

if [ $# -ne 2 ]; then
    echo "usage: $0 <start-year> <end-year>" 1>&2
    exit 0
fi

if [ $end -lt $start ]; then
    echo "invalid arguments: end year must be greater than or equal to start year" 1>&2
    exit 1
fi

i=$start
while [ "$i" -le "$end" ]; do
    for j in $(seq -f "%02g" 1 12); do
        wget -P data/$i/ https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$i-$j.csv
    done
    i=$(( $i + 1 ))
done 



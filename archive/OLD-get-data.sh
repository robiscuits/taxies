#!/bin/bash

rm data_paths.txt

start=$1
end=$2

if [ $# -ne 2 ]; then
    echo "usage: $0 <start-year> <end-year>" 1>&2
    exit 0
fi

for i in $@; do
    if [ $i -gt 2020 ]; then 
        echo "invalid argument: year must be in the range of 2009-2020" 1>&2
        exit 1 
    elif [ $i -lt 2009 ]; then
        echo "invalid argument: year must be in the range of 2009-2020" 1>&2
        exit 1
    fi
done

if [ $end -lt $start ]; then
    echo "invalid arguments: end year must be greater than or equal to start year" 1>&2
    exit 1
fi

i=$start
while [ "$i" -le "$end" ]; do
    for j in $(seq -f "%02g" 1 12); do
        # wget -P data/$i/ https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$i-$j.csv
        echo "https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$i-$j.csv" >> data_paths.txt
    done
    i=$(( $i + 1 ))
done 



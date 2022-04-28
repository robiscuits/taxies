#!/bin/bash

rm data_paths.txt
rm log/*
rm error/*
rm output/*
rm data/*

start=2017
end=2021

i=$start
while [ "$i" -le "$end" ]; do
    for j in $(seq -f "%02g" 1 12); do
        echo "https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$i-$j.csv" >> data_paths.txt
    done
    i=$(( $i + 1 ))
done
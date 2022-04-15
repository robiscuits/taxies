#!/bin/bash

mkdir data

for i in {2009..2020}; do
    for j in $(seq -f "%02g" 1 12); do
        wget -P data/$i/ https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_$i-$j.csv 
    done
done 



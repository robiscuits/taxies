#!/bin/bash
header="objectid,trip_distance,passenger_count,fare_amount,tip_amount,total_amount,count,year,month"
echo  $header > data/all_data.csv
cat *_data.csv >> data/all_data.csv

rm *.csv
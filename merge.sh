#!/bin/bash
header="objectid,trip_distance,passenger_count,fare_amount,tip_amount,total_amount,count,year,month"
echo  $header > data/pu_data.csv
cat pu_*_data.csv >> data/pu_data.csv

echo  $header > data/do_data.csv
cat do_*_data.csv >> data/do_data.csv

rm *.csv
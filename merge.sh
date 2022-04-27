#!/bin/bash
echo "objectid,trip_distance,date" > data/trip_distance.csv
cat trip_distance_*.csv >> data/trip_distance.csv

echo "objectid,passenger_count,date" > data/passenger_count.csv
cat passenger_count_*.csv >> data/passenger_count.csv

echo "objectid,fare_amount,date" > data/fare_amount.csv
cat fare_amount_*.csv >> data/fare_amount.csv

echo "objectid,tip_amount,date" > data/tip_amount.csv
cat tip_amount_*.csv >> data/tip_amount.csv

echo "objectid,total_amount,date" > data/total_amount.csv
cat total_amount_*.csv >> data/total_amount.csv

rm *.csv
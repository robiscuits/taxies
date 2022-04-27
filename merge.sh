#!/bin/bash

cat trip_distance_*.csv > data/trip_distance.csv
cat passenger_count_*.csv > data/passenger_count.csv
cat fare_amount_*.csv > data/fare_amount.csv
cat tip_amount_*.csv > data/tip_amount.csv
cat total_amount_*.csv > data/total_amount.csv

rm *.csv
suppressPackageStartupMessages(library(tidyverse))

args = commandArgs(trailingOnly=TRUE)

if (length(args) != 1) {
  stop("usage: Rscript taxis.R <csv url>")
}

data_url <- args[1]
year <- substring(data_url, 60, 63)
month <- substring(data_url, 65, 66)
month_data <- read_csv(data_url)

df <- month_data %>% 
  select(PULocationID, trip_distance, passenger_count, fare_amount, tip_amount, total_amount) %>% 
  group_by(PULocationID) %>% 
  summarise(
    trip_distance = sum(trip_distance),
    passenger_count = sum(passenger_count),
    fare_amount = sum(fare_amount),
    tip_amount = sum(tip_amount),
    total_amount = sum(total_amount),
    count = n()
    ) %>% 
  mutate(year = year, month = month)

name = paste("pu_", year, "-", month, "_data.csv", sep = "")
write_csv(df, name, col_names = FALSE)

df <- month_data %>% 
  select(DOLocationID, trip_distance, passenger_count, fare_amount, tip_amount, total_amount) %>% 
  group_by(DOLocationID) %>% 
  summarise(
    trip_distance = sum(trip_distance),
    passenger_count = sum(passenger_count),
    fare_amount = sum(fare_amount),
    tip_amount = sum(tip_amount),
    total_amount = sum(total_amount),
    count = n()
    ) %>% 
  mutate(year = year, month = month)

name = paste("do_", year, "-", month, "_data.csv", sep = "")
write_csv(df, name, col_names = FALSE)
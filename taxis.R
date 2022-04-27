suppressPackageStartupMessages(library(tidyverse))

args = commandArgs(trailingOnly=TRUE)

if (length(args) != 1) {
  stop("usage: Rscript taxis.R <csv url>")
}

data_url <- args[1]
month_data <- read_csv(data_url)

df <- month_data %>% 
  select(PULocationID, trip_distance, passenger_count, fare_amount, tip_amount, total_amount) %>% 
  group_by(PULocationID) %>% 
  summarise_all(sum)

new_name <- substring(data_url, 60)
write_csv(df, new_name)
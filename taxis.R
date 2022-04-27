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
  summarise_all(mean)

year <- substring(data_url, 60, 63)
month <- substring(data_url, 65, 66)

for( i in colnames(df)[-1]){
  x <- tibble(
    "a" = df$PULocationID,
    "b" = pull(df, i),
    "c" = year,
    "d" = month
  )
  name = paste(i, "_", year, "-", month, ".csv", sep = "")
  write_csv(x, name, col_names = FALSE)
}
suppressPackageStartupMessages(library(tidyverse))

args = commandArgs(trailingOnly=TRUE)

if (length(args) != 2) {
  stop("usage: Rscript taxis.R <csv url>")
}
# Load libraries
library(RCurl)
library(tidyverse)
library(purrr)
library(here)
library(janitor)
library(rlang)

# Scrape files from SFTP and bind
read_data <- function(u) {
  data <- getURL(u,
                 userpwd = "scoulter@sdcoe.net:Globalscapeafoqt.12")
  read.csv(textConnection(data), 
           sep = ",",
           header =  FALSE,
           stringsAsFactors = F)
} 

cls_file <- "sftp://bssftp.sdcoe.net/CLS/cls_2021-11-04_120227.csv"

cls_results <- cls_file %>%
  map_df(., read_data)

saveRDS(cls_results, here("data", "raw", "cls_results.rds")) # Write file
write_csv(cls_results, file = here("data", "raw", "cls_results.csv"))

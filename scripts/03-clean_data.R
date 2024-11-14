#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
# Load the necessary library
library(dplyr)
library(tidyverse)
# List of file paths
file_paths <- c("file1.csv", "file2.csv", "file3.csv", "file4.csv")

# Read and select columns from each file, renaming the unique column
file1 <- read.csv('data/01-raw_data/raw_data_Food.csv') %>%
  select(country, Food = AG.PRD.FOOD.XD)

file4 <- read.csv('data/01-raw_data/raw_data_Mortality.csv') %>%
  select(country, Mortality = SH.DYN.MORT)

file3 <- read.csv('data/01-raw_data/raw_data_DPT.csv') %>%
  select(country, Vacinne = SH.IMM.IDPT)

file2 <- read.csv('data/01-raw_data/raw_data_Healthexpense.csv') %>%
  select(country, Health_expense = SH.XPD.CHEX.PC.CD)

# Merge all data frames by 'common_column'
merged_data <- file1 %>%
  left_join(file2, by = "country") %>%
  left_join(file3, by = "country") %>%
  left_join(file4, by = "country") %>%
  drop_na()

# Save the final merged file
write.csv(merged_data, "data/02-analysis_data/analysis_data.csv", row.names = FALSE)





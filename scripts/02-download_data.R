#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(WDI)
library(tidyverse)
#### Download data ####
data_Mortality <- WDI(indicator = "SH.DYN.MORT", start = 2022, end = 2022)
data_Food <- WDI(indicator = "AG.PRD.FOOD.XD", start = 2022, end = 2022)


#### Save data ####
write_csv(data_Food, "data/01-raw_data/raw_data_Food.csv") 
write_csv(data_Mortality, "data/01-raw_data/raw_data_Mortality.csv") 

         

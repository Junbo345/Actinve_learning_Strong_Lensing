#### Preamble ####
# Purpose: Downloads and saves the data from World Bank opendata
# Author: Junbo Li
# Date: 12 NOV 2024
# Contact: junb.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(WDI)
library(tidyverse)
#### Download data ####
data_Mortality <- WDI(indicator = "SH.DYN.MORT", start = 2022, end = 2022)
data_Food <- WDI(indicator = "AG.PRD.FOOD.XD", start = 2022, end = 2022)
data_DPT <- WDI(indicator = "SH.IMM.IDPT", start = 2022, end = 2022)
data_Healthexpense <- WDI(indicator = "SH.XPD.CHEX.PC.CD", start = 2021, end = 2021)

#### Save data ####
write_csv(data_Food, "data/01-raw_data/raw_data_Food.csv") 
write_csv(data_Mortality, "data/01-raw_data/raw_data_Mortality.csv")
write_csv(data_DPT, "data/01-raw_data/raw_data_DPT.csv")
write_csv(data_Healthexpense, "data/01-raw_data/raw_data_Healthexpense.csv")

         

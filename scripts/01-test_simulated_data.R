#### Preamble ####
# Purpose: Tests Structure and validity of simulated data to predicted mortality rate
# Author: Junbo Li
# Date: 12 NOV 2024
# Contact: junb.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(testthat)

analysis_data <- read_parquet("data/00-simulated_data/simulated_dataset.parquet")

#### Test cases ####
test_that("Dataset structure and value checks", {
  
  # Test if the dataset has 100 rows
  expect_equal(nrow(dataset), 100, info = "The dataset should have 100 rows.")
  
  # Test if the dataset has 4 columns
  expect_equal(ncol(dataset), 4, info = "The dataset should have 4 columns.")
  
  # Test if 'MortalityRate' values are within the expected range
  expect_true(all(dataset$MortalityRate >= 5 & dataset$MortalityRate <= 100), 
              info = "'MortalityRate' values should be within the range 5 to 100.")
  
  # Test if 'HealthExpenses' values are within the expected range
  expect_true(all(dataset$HealthExpenses >= 0 & dataset$HealthExpenses <= 4000), 
              info = "'HealthExpenses' values should be within the range 0 to 4000.")
  
  # Test if 'DPTVaccineRate' values are within the expected range
  expect_true(all(dataset$DPTVaccineRate >= 0 & dataset$DPTVaccineRate <= 100), 
              info = "'DPTVaccineRate' values should be within the range 0 to 100.")
  
  # Test if 'FoodProductionIndex' values are within the expected range
  expect_true(all(dataset$FoodProductionIndex >= 10 & dataset$FoodProductionIndex <= 100), 
              info = "'FoodProductionIndex' values should be within the range 10 to 100.")
  
  # Test if there are no missing values
  expect_true(all(!is.na(dataset)), info = "The dataset should not contain any missing values.")
  
  # Test if 'MortalityRate' has at least two unique values
  expect_true(length(unique(dataset$MortalityRate)) >= 2, 
              info = "'MortalityRate' should have at least two unique values.")
  
  # Test if there are no negative values in any column
  expect_true(all(dataset$HealthExpenses >= 0 & dataset$DPTVaccineRate >= 0 & 
                    dataset$FoodProductionIndex >= 0 & dataset$MortalityRate >= 0), 
              info = "There should be no negative values in the dataset.")
})

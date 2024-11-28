#### Preamble ####
# Purpose: Tests Structure and validity of cleaned analysis data to predicted mortality rate
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

dataset <- read_parquet(file = here::here("data/02-analysis_data/analysis_data.parquet"))

#### Test cases ####
test_that("Dataset structure and value checks", {
  # Test if the dataset has 100 rows
  expect_equal(nrow(dataset), 182, info = "The dataset should have 100 rows.")

  # Test if the dataset has 4 columns
  expect_equal(ncol(dataset), 5, info = "The dataset should have 4 columns.")

  # Test if 'MortalityRate' values are within the expected range
  expect_true(all(dataset$Mortality >= 0 & dataset$Mortality <= 100),
    info = "'MortalityRate' values should be within the range 0 to 100."
  )

  # Test if 'HealthExpenses' values are within the expected range
  expect_true(all(dataset$Health_expense >= 0),
    info = "'HealthExpenses' values should be larger than 0."
  )

  # Test if 'DPTVaccineRate' values are within the expected range
  expect_true(all(dataset$Vacinne >= 0 & dataset$Vacinne <= 100),
    info = "'DPTVaccineRate' values should be within the range 0 to 100."
  )

  # Test if 'FoodProductionIndex' values are within the expected range
  expect_true(all(dataset$Food >= 0 & dataset$Food <= 500),
    info = "'FoodProductionIndex' values should be within the range 0 to 500."
  )

  # Test if there are no missing values
  expect_true(all(!is.na(dataset)), info = "The dataset should not contain any missing values.")

  # Test if 'MortalityRate' has at least two unique values
  expect_true(length(unique(dataset$Mortality)) >= 2,
    info = "'MortalityRate' should have at least two unique values."
  )

  # Test if there are no negative values in any column
  expect_true(
    all(dataset$Health_expense >= 0 & dataset$Vacinne >= 0 &
      dataset$Food >= 0 & dataset$Mortality >= 0),
    info = "There should be no negative values in the dataset."
  )
})

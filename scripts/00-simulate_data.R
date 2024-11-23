#### Preamble ####
# Purpose: Simulates the data that used to predict the mortality rate in 2022,
# the predictor variables are food production index, health expenses, and DPT vaccine rate
# Author: Junbo Li
# Date: 12 NOV 2024
# Contact: junb.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(arrow)

# Set seed for reproducibility
set.seed(123)

# Generate data
n <- 100  # Number of observations

# Generate predictors
HealthExpenses <- runif(n, 0, 4000)  # Health expenses
DPTVaccineRate <- runif(n, 0, 100)  # DPT vaccine rate
FoodProductionIndex <- runif(n, 10, 100)  # Food production index

# Create MortalityRate negatively related to the other variables
MortalityRate <- 100 - 0.01 * HealthExpenses - 0.3 * DPTVaccineRate - 0.2 * FoodProductionIndex + rnorm(n, mean = 0, sd = 5)

# Combine into a data frame
dataset <- data.frame(
  MortalityRate = MortalityRate,
  HealthExpenses = HealthExpenses,
  DPTVaccineRate = DPTVaccineRate,
  FoodProductionIndex = FoodProductionIndex
)

# Save the dataset as a Parquet file
write_parquet(dataset, "data/00-simulated_data/simulated_dataset.parquet")
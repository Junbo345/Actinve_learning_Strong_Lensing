#### Preamble ####
# Purpose: Obtain an estimate of test score of our model using LOOCV
# Author: Junbo Li
# Date: 12 NOV 2024
# Contact: junb.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Cleaned data and model.
# Any other information needed? None

library(arrow)

# Load dataset
data <- read_parquet(file = here::here("data/02-analysis_data/analysis_data.parquet"))
dataset <- data[, 2:4]
target <- data[, 5]

n <- nrow(dataset)

predictions <- numeric(n)
actuals <- target


model <- read_rds(file = here::here("models/Mortality_Model.rds"))

for (i in 1:n) {
  # Split data into training and testing sets
  train_data <- dataset[-i, ]
  train_target <- target[-i, ]
  test_data <- dataset[i, , drop = FALSE]

  # Predict for the left-out observation
  predictions[i] <- predict(model, newdata = test_data)
}

# Compute LOOCV R-squared
ss_total <- sum((actuals - mean(unlist(actuals)))^2) # Total Sum of Squares
ss_residual <- sum((actuals - predictions)^2) # Residual Sum of Squares
r_squared <- 1 - (ss_residual / ss_total)

# Print the LOOCV R-squared
cat("LOOCV R-squared:", r_squared, "\n")

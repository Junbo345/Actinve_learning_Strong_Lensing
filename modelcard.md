# Model Card for Bayesian Multi-linear Model of Under Five Mortality Rate*

## Model Details

### Model Description

This Model uses the Food production index based on 2014-1016, the DPT vaccine coverage rate, and the log of average health spending (in USD) to predict the log of Mortality rate under five in each nation. All data are available on the World Bank Open-data platform. 

- **Developed by:** Junbo Li
- **Model type:** Bayesian Multi-linear
- **License:** [View the License](LICENSE.txt)

## Uses


### Direct Use

This model could be used to generate a prediction of the Mortality log given the three available predictors.

- **Example code**:

model <- readRDS(file = here::here("models/Mortality_Analysis.rds"))

predict(model, newdata = c(1,1,1))


## Bias, Risks, and Limitations

This model assumes a simple multi-linear relationship between the three predictors and the response variable. Also, the distribution of DPT vaccine coverage rate is skewed to the left, and not normally distributed. 

### Recommendations

Make sure your prior belief of the relationship is a linear relationship and the three predictors are approximately normally distributed. 


## Training Details

### Training Data

The training data is downloaded directly from the World Bank API, code available in [View the code](scripts/02-download_data.R). We cleaned them can saved them into a single parquet file available in [View the parquet](data/02-analysis_data)


### Training Procedure

Here we used the stan_glm function in package rstanarm to train our model details in [view the code](scripts/05-model_data.R). 


#### Training Hyperparameters

- **Training regime:** The stan_glm function needs to specify the  priors of the Bayesian model. The predictors used default priors (N(0,2.5)) and the intercept used N(2.5,1). 


## Evaluation


### Testing Data, Factors & Metrics

#### Testing Data

Since we do not have available testing data, we will use Leace One Out Cross Validation (LOOCV) to obtain an estimate of the testing data. 


#### Metrics

Here the metrics used to test our data is R-squared, which represents the proportion of variance explained by our model. 

### Results

The estimated R-squared using LOOCV is 0.789, detailed code is in [view result](scripts/06-model_evaluation.R)

## Model Card Contact

Junbo Li | junb.li@mail.utoronto.ca

---
*: This modelcard used the template from: Ozoani, Ezi and Gerchick, Marissa and Mitchell, Margaret. Model Card Guidebook. Hugging Face, 2022. https://huggingface.co/docs/hub/en/model-card-guidebook

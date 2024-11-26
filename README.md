# Understanding 2022 Under Five Mortality Using Multilinear Bayesian Framework

## Overview

This repo contains code, data, and analysis of Under Five Mortality Rate in year 2022. It was created by Junbo Li. We used data aviliable on Wold Bank opendata platform and used multi-linear Bayesian model to analysis it. 


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated data that mimic the data we are gonna use.
-   `data/01-raw_data` contains the raw data as obtained from World bank opendata platform.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed for build our model.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data; tests to test the validity of the data; and scripts to generate our model.


## Statement on LLM usage

The R code in scripts and on the paper were written with the help of Chat-GPT4. It is used to generate code and debugging. Also, the paper is written with the help of Chat-GPT4, it was used to generate idea, help conduct data analysis and fix grammar and logical error. The complete chat history is in other/llm_usage/usage.txt.
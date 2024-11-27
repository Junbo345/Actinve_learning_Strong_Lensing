# Understanding 2022 Under Five Mortality Using Multilinear Bayesian Framework

## Overview

This repo contains code, data, and analysis of the five Mortality Rates in the year 2022. It was created by Junbo Li. We used data available on the Wold Bank open-data platform and used a multi-linear Bayesian model to analyze it. 


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated data that mimics the data we will use.
-   `data/01-raw_data` contains the raw data as obtained from the World Bank open-data platform.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed for building our model.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, and clean data; tests to test the validity of the data; and scripts to generate and evaluate our model.

## Model

[View the Model Card](modelcard.md)

## Statement on LLM usage

The R code in scripts and on the paper was written with the help of Chat-GPT4. It is used to generate code and debugging. Also, the paper is written with the help of Chat-GPT4, which was used to create ideas, help conduct data analysis, and fix grammar and logical errors. The complete chat history is in other/llm_usage/usage.txt.


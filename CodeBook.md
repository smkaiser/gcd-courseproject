---
title: "Code Book for Course Project"
subtitle: "Getting and Cleaning Data"
author: "Steve Kaiser"
date: "September 16, 2014"
output: html_document
---


## Variables
    
## Input Data
Input data is taken from the following source files:

Data               | "Test" file           | "Training" file
------------------- ----------------------- ------------------------
List of Subjects   | test/subject_test.txt | train/subject_train.txt
List of Activities | test/y_test.txt       | train/y_train.txt

## Data Cleaning and Transformation
- Only mean and standard deviation measurements are included in the final dataset.
- Variable names are cleaned and standardized. All punctuation inside variable names is changed to periods (.), and leading or trailing punctuation is removed. For example:
```
tBodyAcc-mean()-X
```
becomes
```
tBodyAcc.mean.X
```

## Output
The output data.frame named `means` is a dataset containing the mean of each measurement, grouped by Activity and Subject. Variable names are modified with `mean.` at the beginning to reflect this. For example, `mean.tBodyAcc.mean.Y` indicates that we are showing the mean of all the `tBodyAcc.mean.Y` measurements.

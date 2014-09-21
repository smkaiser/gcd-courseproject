---
title: "Code Book for Course Project"
subtitle: "Getting and Cleaning Data"
author: "Steve Kaiser"
date: "September 16, 2014"
output: html_document
---

## Input Data

A description of the source data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Within the downloaded data, please see `README.txt` and `features_info.txt` for details about the data.

Input data is taken from the following sources, which are space-delimited text files:

Data               | "Test" file             | "Training" file
-------------------|-------------------------|------------------------
List of Subjects   | `test/subject_test.txt` | `train/subject_train.txt`
List of Activities | `test/y_test.txt`       | `train/y_train.txt`
Sensor Measurements| `test/X_test.txt`       | `train/X_train.txt`

In addition, activity labels (walking, standing, etc.) are loaded from `activity_labels.txt`, and column labels for measurements are loaded from `features.txt`.

Test and Training data are separate in the input data, but are merged in this analysis.

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

### Output Columns
* `Activity`: Type of activity. See `activity_labels.txt` for a complete list.
* `Subject`: Anonymous subject (person) identifier.
* `mean.tBodyAcc.mean.X`, `mean.tBodyAcc.mean.Y`, etc.: Means of original input data for this unique Activity-Subject grouping
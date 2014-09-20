# README for course project: Getting and Cleaning Data
=================

## Files available in this repo
* CodeBook.md: Describes input data, transformations, and output
* run_analysis.R: R script to perform analysis

## R package requirements
The `dplyr` and `reshape2` packages are required.

## How to run the analysis
1. Download and unzip the UCI HAR Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Set your working directory to the top level of the UCI HAR Dataset (the directory contains activity_labels.txt, features.txt, and so on).
3. Using R, execute `run_analysis.R`

## run_analysis.R overview
This script
* Reads lookup values from activities.txt
* Reads and column-binds activity, subject and measurement data for both Test and Train datasets, then row-binds Test and Train to create a single dataset. Note that only measurements on mean and standard deviation are included.
* Applies descriptive column names for each measurement
* Summarizes the result into a dataset that shows the mean of each measurement, grouped by activity and subject.

## Notes
Data is tidied according to best practices in "Tidy Data" (http://vita.had.co.nz/papers/tidy-data.pdf).

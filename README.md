gcd-courseproject
=================

## Files available in this repo
* CodeBook.md: Describes input data, transformations, and output
* run_analysis.R: R script to perform analysis

## run_analysis.R overview
This script
* Reads lookup values from activities.txt
* Reads and column-binds activity, subject and measurement data for both Test and Train datasets, then row-binds Test and Train to create a single dataset. Note that only measurements on mean and standard deviation are included.
* Applies descriptive column names for each measurement
* Summarizes the result into a dataset that includes the mean of each measurement, grouped by activity and subject ()

## Notes
Data is tidied according to best practices in "Tidy Data" (http://vita.had.co.nz/papers/tidy-data.pdf).

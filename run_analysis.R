# run_analysis.R
# This is the code for the "Getting and Cleaning Data" course project.
# For explanation, see: https://github.com/smkaiser/gcd-courseproject/blob/master/README.md
# Author: Steve Kaiser
# Date: 2014-09-17
#


# Helper functions
cleanName <- function(inputString) {
    # Change all non-alphanumeric characters to ".", remove duplicates, and remove punctuation
    # from beginning/end of string
    gsub("^\\.+", "",
        gsub("\\.+$", "",
        gsub("\\W+", ".", 
         inputString)))
}

extractMeans <- function() {
    # Load required libraries
    library(dplyr)
    library(reshape2)
    # Check if raw data exists in working directory
    if (length(dir(pattern="activity_labels.txt")) == 0) {
        stop("Input data file(s) not found. Check your working directory.")
    }
    # Load activity lookup
    activities <- read.csv("activity_labels.txt", sep=" ", header = FALSE )
    names(activities) <- c("ActivityIndex", "Activity")
    
    # Load variables
    vars <- read.table("features.txt", sep = " ", header = FALSE)
    # Load test data
    subject_test <- read.csv("test/subject_test.txt", sep="", header = FALSE)
    colnames(subject_test) <- "Subject"
    x_test <- read.csv("test/X_test.txt", sep="", header = FALSE)
    # apply column names 
    names(x_test) <- cleanName(vars$V2)
    y_test <- read.csv("test/y_test.txt", sep="", header = FALSE)
    
    # Load training data
    subject_train <- read.csv("train/subject_train.txt", sep="", header = FALSE)
    colnames(subject_train) <- "Subject"
    x_train <- read.csv("train/X_train.txt", sep="", header = FALSE)
    # apply column names
    names(x_train) <- cleanName(vars$V2)
    y_train <- read.csv("train/y_train.txt", sep="", header = FALSE)
    
    # Merge test and train datasets
    # Get columns containing "mean" and "std" only
    test <- cbind(y_test, subject_test, select(x_test, matches("(mean)|(std)", ignore.case = TRUE)))
    test <- merge(activities, test, by.x=1, by.y=1)
    train <- cbind(y_train, subject_train, select(x_train, matches("(mean)|(std)", ignore.case = TRUE)))
    train <- merge(activities, train, by.x=1, by.y=1)
    
    result <- rbind(test, train)
    
    # Melt result
    r1 <- melt(result, id=c("Subject", "Activity", "ActivityIndex"))
    # Cast into a new summary data.frame grouped by Subject and Activity
    means <- dcast(r1, Activity + Subject ~ variable, mean)
    # Rename measurement columns to prepend "mean."     
    tempnames <- c("Activity", "Subject", paste0("mean.", names(means[-1:-2])))
    names(means) <- tempnames
    # Next line writes the output file; only needed for initial submission
    # write.table(means, file = "means.txt", row.names = FALSE)
    
    # return the dataset of means
    means
}
# Run the main function
means <- extractMeans()
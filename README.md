##Introduction

This data repository contains all files for the Week 4 assignment of the Coursera course "Getting & Cleaning Data" which is part of the Data Science specialisation.

The data used for this assignment was sourced from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data was collected as part of an experiment conducted with a group of 30 volunteers. Each person was asked to wear a Samsung Galaxy S smartphone while performing the following six activities: walking, walking upstairs, walking downstairs, sitting, laying. Using the accelerometer and gyroscope embedded in the smartphones, a number of different signals were measured and recorded. The collected data was then randomly split into a training data set (70% of observations) and a test data set (30% of observations). A full description of the experiment is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The aim of this assignment was to create one R script called run_analysis.R which performs the following data cleaning steps:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As discussed in the Week 4 Forum (https://www.coursera.org/learn/data-cleaning/discussions/weeks/4/threads/g7dwW25DEeaFmBJqjnMcrw) there is some freedom in relation to the interpretation of the second point above.
My final choice was to extract all measures that contain the exact string "mean()" or "std()". 
The original data contains additional variables that contain the word "mean" (e.g. MeanFreq()); however, I deliberately did not extract these variables for the purpose of this assignment.

##Files included in this repository:
* Codebook.md: a more detailed description of the steps undertaken to produce the tidy dataset from the original source data, as well as the list of variables (with description) included in the final tidy data set.
* run_analysis.R: the R code to create the tidy dataset from the original source data
* tidy_wide.txt: a tidy data set containing the mean of each selected measurement by subject and activity
* experiment_info.txt: more information on the raw source data and experiment
* features_info.txt: more information on the measurements captured for the experiment 


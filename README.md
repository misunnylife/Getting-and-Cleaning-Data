# Getting and Cleaning Data Course Project

This repository contains the files for the course "Getting and Cleaning Data" project.
The goal of the project is to demonstrate the ability to collect, work with, and clean data set in steps with the materials taught in the course.

## The Tasks
The project basic tasks are as followed:
 * Merge the training and the test sets in the UCI HAR Dataset file collected from the 		accelerometers from the Samsung Galaxy S smartphone.
 * Extract the mean and standard deviation for each of the measurement.
 * Add descriptive names to activities in the data set.
 * Label the variables in the data set with the descriptive names.
 * From the data set, create a second, independent tidy data set with the average of each variable for each activity and subject.

## The Data
The UCI HAR Dataset contains 561 unlabeled measurements that can be found in X_train and X_test files. The activity labels for the measurements are in the y_train and y_test files. The subjects of the measurements are in the subject_train and subject_test files.

## "run_analysis.R"
The script first downloads the dataset from the provided link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The downloaded file is stored in the working directory as "Dataset.ZIP". In preparation steps, the script creates the "UCI HAR Dataset" directory, and then extracts the data sets into that directory.

Once the data sets are in place, the script merges the training and test data sets into one data set. The mean and standard deviation for the measurements are then extracted, and labeled with the appropriate descriptive names for the activities and variables.

Finally, an indepedent tidy data set is created from the data set that contains the average for each variable per activity and subject. This tidy data set is output as the "tidyAverage.txt" file.

## The Code Book
As a requirement, the repository also provides a code book that describes the variables and the transformations performed by the script to achieve the goal.

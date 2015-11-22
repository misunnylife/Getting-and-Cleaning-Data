# Script name: run-analysis.R
#*************************************************************************************
# START: Load and extract the original data set into the current working directtory.
#*************************************************************************************

# This section checks for the existance of the data set. If the data set does not exist, it downloads
# the original data set per instruction in the course project, extracts the data file into a folder
# "UCI HAR Dataset".
#  >> The directory where the data sets are stored is "UCI HAR Dataset" within the working directory.
#  >> The downloaded zip file is Dataset.zip.

# Process starts
cat("Please wait...")

# Set the data directory name
wdir <- "UCI HAR Dataset"

# Set the dowloaded file name
dlfile <- "Dataset.zip"

# Check for the existence of the data directory.
# NOTE: If this script is run multiple times within the same working directory,
#         checking here will avoid redundant creation of the same data set.
if (!file.exists(wdir))
{
    if (!file.exists(dlfile))
    {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile=dlfile)
    }
    unzip(dlfile)
}

#***********************************************************************
# STEP 1: Merge the training and the test sets to create onde data set.
#         NOTE: The Inertia Signal files in the data sets are not needed
#                for the project so they will be ignored.
#***********************************************************************
#------------------------------------------
# Read individual train set from data file 
#------------------------------------------
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
sbj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#----------------------------------
# Read individual test from data file
#----------------------------------
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
sbj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#----------------------------
# Combine data sets by rows
#----------------------------
xSet <- rbind(X_train, X_test)
ySet <- rbind(Y_train,Y_test)
subjectSet <- rbind(sbj_train,sbj_test)

#------------------------------------
# Merge columns to get one data set
#------------------------------------
subject_activity <- cbind(subjectSet,ySet)
dataSet <- cbind(xSet,subject_activity)

#************************************************************************************************
# STEP 2: Extract only the measurements on the mean and standard deviation for each measurement
#************************************************************************************************
# Read feature names from the file
feature_labels <- read.table("UCI HAR Dataset/features.txt",colClasses = "character")

# Read the desire labels for the training data set
names(xSet) <- feature_labels$V2

# Select only the man and standard deviation
mean_std <- grep("-(mean|std)\\(\\)", feature_labels[,2])

# Subset the data set for the mean and standard deviation columns
xSet <- xSet[,mean_std]

# Name the columns with the correct names from feature sets
names(xSet) <- feature_labels[mean_std,2]

#******************************************************************************
# STEP 3 Use descriptive activity names to name the activities in the data set
#******************************************************************************
# Read the activity names from file
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Names the values with the correct activity names
ySet[,1] <- activity_labels[ySet[,1],2]

# Correct the activity data set
names(ySet) <- "activity"

# Name the subject data set
names(subjectSet) <- "subject"

# Combine all into a single data set with descriptive activity names
dataSet <- cbind(xSet,ySet,subjectSet)

#**************************************************************
# STEP 4: label the data set with descriptive variable names
#**************************************************************
# Replace t with time
names(dataSet) <- gsub("^t", "time", names(dataSet))

# Replace f with frequency
names(dataSet) <- gsub("^f", "frequency", names(dataSet))
                       
# Replace Acc with Accelerometer
names(dataSet) <- gsub("Acc", "Accelerometer", names(dataSet))

# Replace Gyro with Gyroscope
names(dataSet) <- gsub("Gyro", "Gyroscope", names(dataSet))

# Repalce Mag with Magintude
names(dataSet) <- gsub("Mag", "Magnitude", names(dataSet))

# Replace BodyBody with Body
names(dataSet) <- gsub("BodyBody", "Body", names(dataSet))

#**********************************************************************
# STEP 5: create a second, independent tidy data set with the average
#         of each variable for each activity and each subject
#**********************************************************************
# This step requires plyr library
library(plyr)

#averageData <- ddply(dataSet,.(subject,activity),function(x) colMean(x[,1:66]))
averageData <- aggregate(. ~subject + activity, dataSet, mean)

# Sort the data set in ascending order by the subject and activity
averageData <- averageData[order(averageData$subject, averageData$activity),]

# Output the tidy data set
write.table(averageData, "tidyAverage.txt", row.name=FALSE)

# Process ends
cat(" run_analysis Completed! --> output to file 'tidyAverage.txt'")
#### END OF SCRIPT run_analysis.R#################################################################
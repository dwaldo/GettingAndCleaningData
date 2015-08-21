
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###
### The goal of this script is to prepare tidy data that can be used for 
### later analysis.
###
### This script assumes that this data:
###    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
### has been downloaded and unziped into the "UCI HAR Dataset" subdirectory 
### in the local, working directory
### 
### This script does the following:
###
###   1) Merges the training and the test sets to create one data set.
###   2) Extracts only the measurements on the mean and standard deviation 
###      for each measurement. 
###   3) Uses descriptive activity names to name the activities in the data set.
###   4) Appropriately labels the data set with descriptive variable names. 
###   5) From the data set in step 4, creates a second, independent tidy data 
###      set with the average of each variable for each activity and each subject.
###
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 0: Load data
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
baseDir <- "UCI HAR Dataset"

###
### Load metadata
###
activityLabels <- read.table(
  sprintf("%s/activity_labels.txt", baseDir),
  stringsAsFactors = FALSE,
  col.names = c("levels", "labels"),
  header = FALSE
)

featureLabels <- read.table(
  sprintf("%s/features.txt", baseDir),
  stringsAsFactors = FALSE,
  header = FALSE
)

###
### Load training data
###
envDir <- "train"

trainFeatures <- read.table(
  sprintf("%s/%s/X_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)
trainActivity <- read.table(
  sprintf("%s/%s/y_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)
trainSubject <- read.table(
  sprintf("%s/%s/subject_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)

###
### Combine TRAINING subject, activity, and feature data
###
trainData <- cbind(
  Subject = trainSubject$V1, 
  Activity = trainActivity$V1, 
  trainFeatures
)

### 
### Load test data
### 
envDir <- "test"

testFeatures <- read.table(
  sprintf("%s/%s/X_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)
testActivity <- read.table(
  sprintf("%s/%s/y_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)
testSubject <- read.table(
  sprintf("%s/%s/subject_%s.txt", baseDir, envDir, envDir), 
  header = FALSE
)

###
### Combine TEST subject, activity, and feature data
###
testData <- cbind(
  Subject = testSubject$V1, 
  Activity = testActivity$V1,
  testFeatures
)


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 1: Merge the training and the test sets to create one data set.
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
totalData <- rbind(trainData, testData)
colnames(totalData) <- c("Subject", "Activity", featureLabels$V2)


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 2: Extract only the measurements on the mean and standard deviation 
### for each measurement. 
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### 
### For mean measurements, I choose to include only measurements labeled with "mean()"
### In the feature_info.txt file, these were described as:
###    mean(): Mean value
###
### I also choose to include the measurements with labels that included "meanFreq()",
### In the feature_info.txt file, these were described as:
###    meanFreq(): Weighted average of the frequency components to obtain a 
###                mean frequency
###
### I chose NOT to include measurements of ALL labels that included the 
### word "Mean", such as:
###
###    angle(X,gravityMean)
###
### Since, in my interpretation, this is a measurement of an angle
### (measured against a mean), not a mean statistic.
###
keepColumns <- grepl("Subject|Activity|mean\\(\\)|std\\(\\)|meanFreq\\(\\)", colnames(totalData))
trunData <- totalData[, keepColumns]


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 3: Uses descriptive activity names to name the activities in the 
### data set
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Convert Activity column to a factor using the values from the metadata
### in the activity_labesls.txt file.
trunData$Activity <- factor(
  trunData$Activity, 
  levels = activityLabels$levels,
  labels = activityLabels$labels
)


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 4: Appropriately labels the data set with descriptive variable names
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Note: I choose to use descriptive vaiable names based on readability, not
### ease of typing or input. Granted, a lable like:
###
###    "TimeGravityAccelerometerMagnitudeMean"
###
### is quite cumbersome to type, and has mixed-case, it is quite readable and
### can be scanned quickly by the reader.
###
### Labels that begin with "Freq" refer to "Frequency"
### Labels that begin with "t" refer to "Time"
### Labels that contain "Gyro" refer to "Gyroscopic"
### Labels that contain "BodyBody" is a typo for "Body"
### Labels that contain "Mag" refer to "Magnitude"
### Labels that contain "-mean()" refer to "Mean"
### Labels that contain "-std()" refer to "STD" (StandardDeviation)
featureNames <- names(trunData)
featureNames <- gsub("^t", "Time", featureNames)
featureNames <- gsub("Acc", "Accelerometer", featureNames)
featureNames <- gsub("Gyro", "Gyroscope", featureNames)
featureNames <- gsub("Mag", "Magnitude", featureNames)
featureNames <- gsub("BodyBody", "Body", featureNames)
featureNames <- gsub("-mean\\(\\)", "Mean", featureNames)
featureNames <- gsub("-meanFreq\\(\\)", "MeanFrequency", featureNames)
featureNames <- gsub("-std\\(\\)", "STD", featureNames)
names(trunData) <- featureNames


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Step 5: From the data set in step 4, creates a second, independent tidy 
### data set with the average of each variable for each activity and 
### each subject.
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tidyData <- aggregate(
  trunData[,3:ncol(trunData)], 
  by=list(Activity = trunData$Activity, Subject = trunData$Subject), 
  FUN=mean
)
tidyData <- tidyData[order( tidyData$Activity, tidyData$Subject),]
write.table(tidyData, file = "tidyData.txt", row.names = FALSE)

#A person wanting to make life easy for their marker would give the code for reading the file back into R in the readMe.

### The file can be read into R with the command below. It has
### 180 (30 subjects x 6 activities) observations x 81 features/variables.
### myData <- read.table("tidyData.txt", header = TRUE)

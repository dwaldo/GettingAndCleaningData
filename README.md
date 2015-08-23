Getting and Cleaning Data
=========================

Description
-----------

The purpose of this project is to demonstrate an ability to collect, work 
with, and clean a data set. The goal is to prepare tidy data that can be 
used for later analysis. 

One of the most exciting areas in all of data science right now is wearable 
computing - see for example this article. Companies like Fitbit, Nike, 
and Jawbone Up are racing to develop the most advanced algorithms to 
attract new users. The data for this project represents data collected 
from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The main goal of the project is to write an R script called `run_analysis.R` that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Assumptions
-----------

The `run_analysis.R` script assumes that the data listed above has been 
downloaded and unzipped into the `UCI HAR Dataset` sub-directory 
in the local, working directory.

Steps to Reproduce
------------------
Within R or RStudio, set your working directory to the directory containing
the `UCI HAR Dataset` sub-directory and the `run_analysis.R` script, then
source the script:

```r
  source("run_analysis.R")
```

Output
------
After successful completion, the script will output a tidy data set in
in the working directory in a file named `tidyData.txt`. This data can be 
read back into R with the following command:

```r
  myData <- read.table("tidyData.txt", header = TRUE)
```

It contains 180 (30 subjects x 6 activities) observations x 81 
features/variables. See the `codebook.md` file for more information.

Repo Contents
-------------
* `README.md`: This file describing the project and code execution
* `codebook.md`: Information about the original data, and the raw and tidy data processing process
* `run_analysis.R`: R script to transform raw data into tidy data set

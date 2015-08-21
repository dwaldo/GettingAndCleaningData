Code Book
=========================

Original Data
-------------
The original data were produced by experiments carried out on a group of 30 
volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
It is available for download at:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The original data was grouped into a training set (21 subjects) and a 
training data set (9 subjects). Each of these groups contained 3 files
listing subject, activities, and 561 measurements, and 2947 observations.
More details can be found in these files in `UCI HAR Dataset` sub-directory 
of the archive listed above:

* `README.txt`: Description of files and data 
* `features.txt`: List of all features.
* `features_info.txt`: Shows information about the variables used on the feature vector.
* `activity_labels.txt`: Links the class labels with their activity name.

Raw Data Processing
-------------------
Processing the raw data consisted of:
* Combining subject, activity, and feature (measurements) data for both the training and test data sets
* Merge the training and test data sets in to a single data set with observations for all 30 users.
* Extract only the measurements on the mean and standard deviation for each measurement.

For mean measurements, I choose to include measurements labeled with "mean()"
In the feature_info.txt file, these were described as:
```r
mean(): Mean value
```
I also choose to include the measurements with labels that included "meanFreq()"
In the feature_info.txt file, these were described as:
```r
meanFreq(): Weighted average of the frequency components to obtain a
            mean frequency
```

I chose NOT to include measurements of ALL labels that included the
word "Mean", such as:
```r
angle(X,gravityMean)
```
Since, in my interpretation, this is a measurement of an angle
(measured against a mean), not a mean statistic.


Tidy Data Processing
-------------------

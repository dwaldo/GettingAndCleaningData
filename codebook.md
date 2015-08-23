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
listing subject, activities, and 561 features, and 2947 observations.
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

This filtering process reduced the original 563 columns (Subject, Activity, 561 features) to the 81 columns listed below:
```r
 [1] "Subject"                                     
 [2] "Activity"                                    
 [3] "TimeBodyAccelerometerMean-X"                 
 [4] "TimeBodyAccelerometerMean-Y"                 
 [5] "TimeBodyAccelerometerMean-Z"                 
 [6] "TimeBodyAccelerometerSTD-X"                  
 [7] "TimeBodyAccelerometerSTD-Y"                  
 [8] "TimeBodyAccelerometerSTD-Z"                  
 [9] "TimeGravityAccelerometerMean-X"              
[10] "TimeGravityAccelerometerMean-Y"              
[11] "TimeGravityAccelerometerMean-Z"              
[12] "TimeGravityAccelerometerSTD-X"               
[13] "TimeGravityAccelerometerSTD-Y"               
[14] "TimeGravityAccelerometerSTD-Z"               
[15] "TimeBodyAccelerometerJerkMean-X"             
[16] "TimeBodyAccelerometerJerkMean-Y"             
[17] "TimeBodyAccelerometerJerkMean-Z"             
[18] "TimeBodyAccelerometerJerkSTD-X"              
[19] "TimeBodyAccelerometerJerkSTD-Y"              
[20] "TimeBodyAccelerometerJerkSTD-Z"              
[21] "TimeBodyGyroscopeMean-X"                     
[22] "TimeBodyGyroscopeMean-Y"                     
[23] "TimeBodyGyroscopeMean-Z"                     
[24] "TimeBodyGyroscopeSTD-X"                      
[25] "TimeBodyGyroscopeSTD-Y"                      
[26] "TimeBodyGyroscopeSTD-Z"                      
[27] "TimeBodyGyroscopeJerkMean-X"                 
[28] "TimeBodyGyroscopeJerkMean-Y"                 
[29] "TimeBodyGyroscopeJerkMean-Z"                 
[30] "TimeBodyGyroscopeJerkSTD-X"                  
[31] "TimeBodyGyroscopeJerkSTD-Y"                  
[32] "TimeBodyGyroscopeJerkSTD-Z"                  
[33] "TimeBodyAccelerometerMagnitudeMean"          
[34] "TimeBodyAccelerometerMagnitudeSTD"           
[35] "TimeGravityAccelerometerMagnitudeMean"       
[36] "TimeGravityAccelerometerMagnitudeSTD"        
[37] "TimeBodyAccelerometerJerkMagnitudeMean"      
[38] "TimeBodyAccelerometerJerkMagnitudeSTD"       
[39] "TimeBodyGyroscopeMagnitudeMean"              
[40] "TimeBodyGyroscopeMagnitudeSTD"               
[41] "TimeBodyGyroscopeJerkMagnitudeMean"          
[42] "TimeBodyGyroscopeJerkMagnitudeSTD"           
[43] "fBodyAccelerometerMean-X"                    
[44] "fBodyAccelerometerMean-Y"                    
[45] "fBodyAccelerometerMean-Z"                    
[46] "fBodyAccelerometerSTD-X"                     
[47] "fBodyAccelerometerSTD-Y"                     
[48] "fBodyAccelerometerSTD-Z"                     
[49] "fBodyAccelerometerMeanFrequency-X"           
[50] "fBodyAccelerometerMeanFrequency-Y"           
[51] "fBodyAccelerometerMeanFrequency-Z"           
[52] "fBodyAccelerometerJerkMean-X"                
[53] "fBodyAccelerometerJerkMean-Y"                
[54] "fBodyAccelerometerJerkMean-Z"                
[55] "fBodyAccelerometerJerkSTD-X"                 
[56] "fBodyAccelerometerJerkSTD-Y"                 
[57] "fBodyAccelerometerJerkSTD-Z"                 
[58] "fBodyAccelerometerJerkMeanFrequency-X"       
[59] "fBodyAccelerometerJerkMeanFrequency-Y"       
[60] "fBodyAccelerometerJerkMeanFrequency-Z"       
[61] "fBodyGyroscopeMean-X"                        
[62] "fBodyGyroscopeMean-Y"                        
[63] "fBodyGyroscopeMean-Z"                        
[64] "fBodyGyroscopeSTD-X"                         
[65] "fBodyGyroscopeSTD-Y"                         
[66] "fBodyGyroscopeSTD-Z"                         
[67] "fBodyGyroscopeMeanFrequency-X"               
[68] "fBodyGyroscopeMeanFrequency-Y"               
[69] "fBodyGyroscopeMeanFrequency-Z"               
[70] "fBodyAccelerometerMagnitudeMean"             
[71] "fBodyAccelerometerMagnitudeSTD"              
[72] "fBodyAccelerometerMagnitudeMeanFrequency"    
[73] "fBodyAccelerometerJerkMagnitudeMean"         
[74] "fBodyAccelerometerJerkMagnitudeSTD"          
[75] "fBodyAccelerometerJerkMagnitudeMeanFrequency"
[76] "fBodyGyroscopeMagnitudeMean"                 
[77] "fBodyGyroscopeMagnitudeSTD"                  
[78] "fBodyGyroscopeMagnitudeMeanFrequency"        
[79] "fBodyGyroscopeJerkMagnitudeMean"             
[80] "fBodyGyroscopeJerkMagnitudeSTD"              
[81] "fBodyGyroscopeJerkMagnitudeMeanFrequency"
```

Tidy Data Processing
-------------------
The Tidy data processing consisted of enhanced labeling and data summarization.

1) The Activity column was converted to a factor with appropriate labels:
```r
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING 
STANDING
LAYING
```
2) The feature/column abbreviated labels were converted to easier-to-read 
labels. I choose to use descriptive label names based on readability, 
not ease of typing or input. Granted, a lable like:
```r
TimeGravityAccelerometerMagnitudeMean
```
is quite cumbersome to type, but it is quite readable and can be visually
scanned quickly by the reader. This relabeling followed these rules:

* Labels that begin with "t" refer to "Time"
* Labels that contain "Acc" refer to "Accelerometer"
* Labels that contain "Gyro" refer to "Gyroscopic"
* Labels that contain "Mag" refer to "Magnitude"
* Labels that contain "BodyBody" is a typo for "Body"
* Labels that contain "-mean()" refer to "Mean"
* Labels that contain "-meanFreq()" refer to "MeanFrequency"
* Labels that contain "-std()" refer to "STD"

The original 81 columns labels were converted to:
```r
 [1] "Activity"                                    
 [2] "Subject"                                     
 [3] "TimeBodyAccelerometerMean-X"                 
 [4] "TimeBodyAccelerometerMean-Y"                 
 [5] "TimeBodyAccelerometerMean-Z"                 
 [6] "TimeBodyAccelerometerSTD-X"                  
 [7] "TimeBodyAccelerometerSTD-Y"                  
 [8] "TimeBodyAccelerometerSTD-Z"                  
 [9] "TimeGravityAccelerometerMean-X"              
[10] "TimeGravityAccelerometerMean-Y"              
[11] "TimeGravityAccelerometerMean-Z"              
[12] "TimeGravityAccelerometerSTD-X"               
[13] "TimeGravityAccelerometerSTD-Y"               
[14] "TimeGravityAccelerometerSTD-Z"               
[15] "TimeBodyAccelerometerJerkMean-X"             
[16] "TimeBodyAccelerometerJerkMean-Y"             
[17] "TimeBodyAccelerometerJerkMean-Z"             
[18] "TimeBodyAccelerometerJerkSTD-X"              
[19] "TimeBodyAccelerometerJerkSTD-Y"              
[20] "TimeBodyAccelerometerJerkSTD-Z"              
[21] "TimeBodyGyroscopeMean-X"                     
[22] "TimeBodyGyroscopeMean-Y"                     
[23] "TimeBodyGyroscopeMean-Z"                     
[24] "TimeBodyGyroscopeSTD-X"                      
[25] "TimeBodyGyroscopeSTD-Y"                      
[26] "TimeBodyGyroscopeSTD-Z"                      
[27] "TimeBodyGyroscopeJerkMean-X"                 
[28] "TimeBodyGyroscopeJerkMean-Y"                 
[29] "TimeBodyGyroscopeJerkMean-Z"                 
[30] "TimeBodyGyroscopeJerkSTD-X"                  
[31] "TimeBodyGyroscopeJerkSTD-Y"                  
[32] "TimeBodyGyroscopeJerkSTD-Z"                  
[33] "TimeBodyAccelerometerMagnitudeMean"          
[34] "TimeBodyAccelerometerMagnitudeSTD"           
[35] "TimeGravityAccelerometerMagnitudeMean"       
[36] "TimeGravityAccelerometerMagnitudeSTD"        
[37] "TimeBodyAccelerometerJerkMagnitudeMean"      
[38] "TimeBodyAccelerometerJerkMagnitudeSTD"       
[39] "TimeBodyGyroscopeMagnitudeMean"              
[40] "TimeBodyGyroscopeMagnitudeSTD"               
[41] "TimeBodyGyroscopeJerkMagnitudeMean"          
[42] "TimeBodyGyroscopeJerkMagnitudeSTD"           
[43] "fBodyAccelerometerMean-X"                    
[44] "fBodyAccelerometerMean-Y"                    
[45] "fBodyAccelerometerMean-Z"                    
[46] "fBodyAccelerometerSTD-X"                     
[47] "fBodyAccelerometerSTD-Y"                     
[48] "fBodyAccelerometerSTD-Z"                     
[49] "fBodyAccelerometerMeanFrequency-X"           
[50] "fBodyAccelerometerMeanFrequency-Y"           
[51] "fBodyAccelerometerMeanFrequency-Z"           
[52] "fBodyAccelerometerJerkMean-X"                
[53] "fBodyAccelerometerJerkMean-Y"                
[54] "fBodyAccelerometerJerkMean-Z"                
[55] "fBodyAccelerometerJerkSTD-X"                 
[56] "fBodyAccelerometerJerkSTD-Y"                 
[57] "fBodyAccelerometerJerkSTD-Z"                 
[58] "fBodyAccelerometerJerkMeanFrequency-X"       
[59] "fBodyAccelerometerJerkMeanFrequency-Y"       
[60] "fBodyAccelerometerJerkMeanFrequency-Z"       
[61] "fBodyGyroscopeMean-X"                        
[62] "fBodyGyroscopeMean-Y"                        
[63] "fBodyGyroscopeMean-Z"                        
[64] "fBodyGyroscopeSTD-X"                         
[65] "fBodyGyroscopeSTD-Y"                         
[66] "fBodyGyroscopeSTD-Z"                         
[67] "fBodyGyroscopeMeanFrequency-X"               
[68] "fBodyGyroscopeMeanFrequency-Y"               
[69] "fBodyGyroscopeMeanFrequency-Z"               
[70] "fBodyAccelerometerMagnitudeMean"             
[71] "fBodyAccelerometerMagnitudeSTD"              
[72] "fBodyAccelerometerMagnitudeMeanFrequency"    
[73] "fBodyAccelerometerJerkMagnitudeMean"         
[74] "fBodyAccelerometerJerkMagnitudeSTD"          
[75] "fBodyAccelerometerJerkMagnitudeMeanFrequency"
[76] "fBodyGyroscopeMagnitudeMean"                 
[77] "fBodyGyroscopeMagnitudeSTD"                  
[78] "fBodyGyroscopeMagnitudeMeanFrequency"        
[79] "fBodyGyroscopeJerkMagnitudeMean"             
[80] "fBodyGyroscopeJerkMagnitudeSTD"              
[81] "fBodyGyroscopeJerkMagnitudeMeanFrequency"
```
3) Finally, the data was summarized by taking the mean of each measurement 
(columns 3-81) for each activity for each subject. This transformed the 
original 2947 raw observations to 180 (30 subjects x 6 activities) summary
statistics. The units of these mean statistics are the same as those of the
original data that are listed in the `features_info.txt` file of the 
original data archive.



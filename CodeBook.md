---
title: "Getting and Cleaning Data Course - Project"
author: "RJP"
date: "8/1/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Code Book

This code book describes the transformations on the original data sets made by run_analysis.R and the definition of variables in tidy data set named Tidy.txt.

## Transformations on the original data sets

To transform the original data sets, we created one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Descriptions of the variables in original data sets and in the tidy data set named "Tidy.txt"

The features selected in the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

*Note:* features were normalized and bounded within [-1,1].

***After select only the measurements on the mean and standard deviation for each measurement, we took the average of each variable for each activity and each subject, and save them in a tidy data, that contains the following columns:***

* 1 Subject: the ID of the subject
* 2 Activity: the name of the activity performed by the subject when measurements were taken
* ***Variables:***
*  3                       TimeBodyAccelerometerMean-X
*  4                       TimeBodyAccelerometerMean-Y
*  5                       TimeBodyAccelerometerMean-Z
*  6                        TimeBodyAccelerometerStd-X
*  7                        TimeBodyAccelerometerStd-Y
*  8                        TimeBodyAccelerometerStd-Z
*  9                    TimeGravityAccelerometerMean-X
* 10                    TimeGravityAccelerometerMean-Y
* 11                    TimeGravityAccelerometerMean-Z
* 12                     TimeGravityAccelerometerStd-X
* 13                     TimeGravityAccelerometerStd-Y
* 14                     TimeGravityAccelerometerStd-Z
* 15                   TimeBodyAccelerometerJerkMean-X
* 16                   TimeBodyAccelerometerJerkMean-Y
* 17                   TimeBodyAccelerometerJerkMean-Z
* 18                    TimeBodyAccelerometerJerkStd-X
* 19                    TimeBodyAccelerometerJerkStd-Y
* 20                    TimeBodyAccelerometerJerkStd-Z
* 21                           TimeBodyGyroscopeMean-X
* 22                           TimeBodyGyroscopeMean-Y
* 23                           TimeBodyGyroscopeMean-Z
* 24                            TimeBodyGyroscopeStd-X
* 25                            TimeBodyGyroscopeStd-Y
* 26                            TimeBodyGyroscopeStd-Z
* 27                       TimeBodyGyroscopeJerkMean-X
* 28                       TimeBodyGyroscopeJerkMean-Y
* 29                       TimeBodyGyroscopeJerkMean-Z
* 30                        TimeBodyGyroscopeJerkStd-X
* 31                        TimeBodyGyroscopeJerkStd-Y
* 32                        TimeBodyGyroscopeJerkStd-Z
* 33                TimeBodyAccelerometerMagnitudeMean
* 34                 TimeBodyAccelerometerMagnitudeStd
* 35             TimeGravityAccelerometerMagnitudeMean
* 36              TimeGravityAccelerometerMagnitudeStd
* 37            TimeBodyAccelerometerJerkMagnitudeMean
* 38             TimeBodyAccelerometerJerkMagnitudeStd
* 39                    TimeBodyGyroscopeMagnitudeMean
* 40                     TimeBodyGyroscopeMagnitudeStd
* 41                TimeBodyGyroscopeJerkMagnitudeMean
* 42                 TimeBodyGyroscopeJerkMagnitudeStd
* 43                  FrequencyBodyAccelerometerMean-X
* 44                  FrequencyBodyAccelerometerMean-Y
* 45                  FrequencyBodyAccelerometerMean-Z
* 46                   FrequencyBodyAccelerometerStd-X
* 47                   FrequencyBodyAccelerometerStd-Y
* 48                   FrequencyBodyAccelerometerStd-Z
* 49              FrequencyBodyAccelerometerMeanFreq-X
* 50              FrequencyBodyAccelerometerMeanFreq-Y
* 51              FrequencyBodyAccelerometerMeanFreq-Z
* 52              FrequencyBodyAccelerometerJerkMean-X
* 53              FrequencyBodyAccelerometerJerkMean-Y
* 54              FrequencyBodyAccelerometerJerkMean-Z
* 55               FrequencyBodyAccelerometerJerkStd-X
* 56               FrequencyBodyAccelerometerJerkStd-Y
* 57               FrequencyBodyAccelerometerJerkStd-Z
* 58          FrequencyBodyAccelerometerJerkMeanFreq-X
* 59          FrequencyBodyAccelerometerJerkMeanFreq-Y
* 60          FrequencyBodyAccelerometerJerkMeanFreq-Z
* 61                      FrequencyBodyGyroscopeMean-X
* 62                      FrequencyBodyGyroscopeMean-Y
* 63                      FrequencyBodyGyroscopeMean-Z
* 64                       FrequencyBodyGyroscopeStd-X
* 65                       FrequencyBodyGyroscopeStd-Y
* 66                       FrequencyBodyGyroscopeStd-Z
* 67                  FrequencyBodyGyroscopeMeanFreq-X
* 68                  FrequencyBodyGyroscopeMeanFreq-Y
* 69                  FrequencyBodyGyroscopeMeanFreq-Z
* 70           FrequencyBodyAccelerometerMagnitudeMean
* 71            FrequencyBodyAccelerometerMagnitudeStd
* 72       FrequencyBodyAccelerometerMagnitudeMeanFreq
* 73       FrequencyBodyAccelerometerJerkMagnitudeMean
* 74        FrequencyBodyAccelerometerJerkMagnitudeStd
* 75   FrequencyBodyAccelerometerJerkMagnitudeMeanFreq
* 76               FrequencyBodyGyroscopeMagnitudeMean
* 77                FrequencyBodyGyroscopeMagnitudeStd
* 78           FrequencyBodyGyroscopeMagnitudeMeanFreq
* 79           FrequencyBodyGyroscopeJerkMagnitudeMean
* 80            FrequencyBodyGyroscopeJerkMagnitudeStd
* 81       FrequencyBodyGyroscopeJerkMagnitudeMeanFreq
* 82          Angle(TimeBodyAccelerometerMean,Gravity)
* 83 Angle(TimeBodyAccelerometerJerkMean),GravityMean)
* 84          Angle(TimeBodyGyroscopeMean,GravityMean)
* 85      Angle(TimeBodyGyroscopeJerkMean,GravityMean)
* 86                              Angle(X,GravityMean)
* 87                              Angle(Y,GravityMean)
* 88                              Angle(Z,GravityMean)


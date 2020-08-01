---
title: "Getting and Cleaning Data Course - Project"
author: "RJP"
date: "8/1/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked here represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The full data used this project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We created one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In our Github repository, you will find the following files:

1. run_analysis.R : the R-code run on the data set

2. Tidy.txt : the final tidy data generated from the original data using run_analysis.R

3. CodeBook.md : a code book that describes the variables, the data, and the transformations to clean up the data.

4. README.md : the explained step-to-step of the code in run_analysis.R

## Loading original data and informations

***I.*** In this first step we load features names and activities labels for the original data and save them into data frames:

```{r}
featureNames <- read.table("UCI HAR Dataset/features.txt",header = FALSE)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
```

***II.*** The next step is to read the original data from the test and training sets and to save them into data frames:

```{r}
testFeatures <- read.table(file = "UCI HAR Dataset/test/X_test.txt",header = FALSE)
testActivities <- read.table(file = "UCI HAR Dataset/test/y_test.txt",header = FALSE)
testSubjects <- read.table(file = "UCI HAR Dataset/test/subject_test.txt",header = FALSE)

trainingFeatures <- read.table(file = "UCI HAR Dataset/train/X_train.txt",header = FALSE)
trainingActivities <- read.table(file = "UCI HAR Dataset/train/y_train.txt",header = FALSE)
trainingSubjects <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",header = FALSE)
```

## 1. Merges the training and the test sets to create one data set

***1.1.*** Here we bind the rows for each of the data sets (Features, Activities and Subjects) to create a joined data (test + training):

```{r}
features <- rbind(testFeatures, trainingFeatures)
activities <- rbind(testActivities, trainingActivities)
subjects <- rbind(testSubjects, trainingSubjects)
```

***1.2.*** Here we are naming columns for the data sets using features names:

```{r}
colnames(features) <- featureNames[,2]
colnames(activities) <- "Activity"
colnames(subjects) <- "Subject"
```

***1.3.*** Then we merges(bind) the data sets (Features, Activities and Subjects) to create one complete data set:

```{r}
fullData <- cbind(subjects,activities,features)
```

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

Here we are filtering the full data set extracting only the measurements on the mean and standard deviation for each measurement:

```{r}
selectedFeatures <- grep(".*Mean.*|.*Std.*", names(fullData), ignore.case=TRUE)
fullData <- fullData[ , c(1, 2, selectedFeatures)]
```

## 3. Uses descriptive activity names to name the activities in the data set

Here we bring the activities labels to the full data set:  

```{r}
fullData <- merge(fullData, activityLabels, by.x = "Activity", by.y = "V1")
fullData$Activity <- fullData$V2
fullData$V2 <- NULL
```

## 4. Appropriately labels the data set with descriptive variable names

***4.1.*** Viewing the actual variable names:

```{r}
names(fullData)
```

***4.2.*** Replacing abbreviations to more appropriate and descriptive words:

```{r}
names(fullData) <- gsub("Acc", "Accelerometer", names(fullData))
names(fullData) <- gsub("Gyro", "Gyroscope", names(fullData))
names(fullData) <- gsub("BodyBody", "Body", names(fullData))
names(fullData) <- gsub("Mag", "Magnitude", names(fullData))
names(fullData) <- gsub("^t", "Time", names(fullData))
names(fullData) <- gsub("^f", "Frequency", names(fullData))
names(fullData) <- gsub("tBody", "TimeBody", names(fullData))
names(fullData) <- gsub("-mean", "Mean", names(fullData), ignore.case = TRUE)
names(fullData) <- gsub("-std", "Std", names(fullData), ignore.case = TRUE)
names(fullData) <- gsub("-meanFreq", "MeanFrequency", names(fullData), ignore.case = TRUE)
names(fullData) <- gsub("angle", "Angle", names(fullData))
names(fullData) <- gsub("gravity", "Gravity", names(fullData))
names(fullData) <- gsub("\\()", "", names(fullData))
```

***4.3.*** Viewing the updated variable names:

```{r}
names(fullData)
```

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

***5.1.*** Creating a tidy data set with the average of each variable for each activity and each subject:

```{r}
tidyData <- aggregate(. ~ Subject + Activity, fullData, mean)
```

***5.2.*** Ordering the tidy data set by "Subject" and then by "Activity":

```{r}
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity), ]
```

***5.3.*** The final step is to save the tidy data set on directory:

```{r}
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
```

## Getting and Cleaning Data Course Project
## Last modification: 08/01/2020

## 1. Merges the training and the test sets to create one data set.

# Load features names and activities labels

featureNames <- read.table("UCI HAR Dataset/features.txt",header = FALSE)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read in the data into the test and training sets
testFeatures <- read.table(file = "UCI HAR Dataset/test/X_test.txt",header = FALSE)
testActivities <- read.table(file = "UCI HAR Dataset/test/y_test.txt",header = FALSE)
testSubjects <- read.table(file = "UCI HAR Dataset/test/subject_test.txt",header = FALSE)

trainingFeatures <- read.table(file = "UCI HAR Dataset/train/X_train.txt",header = FALSE)
trainingActivities <- read.table(file = "UCI HAR Dataset/train/y_train.txt",header = FALSE)
trainingSubjects <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",header = FALSE)

# Bind the rows for each of the data sets (Features, Activities and Subjects) to create a joined data (test + training)

features <- rbind(testFeatures, trainingFeatures)
activities <- rbind(testActivities, trainingActivities)
subjects <- rbind(testSubjects, trainingSubjects)

# Naming columns for the data sets

colnames(features) <- featureNames[,2]
colnames(activities) <- "Activity"
colnames(subjects) <- "Subject"

# Merges(bind) the data sets (Features, Activities and Subjects) to create one complete data set

fullData <- cbind(subjects,activities,features)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

selectedFeatures <- grep(".*Mean.*|.*Std.*", names(fullData), ignore.case=TRUE)
fullData <- fullData[ , c(1, 2, selectedFeatures)]

## 3. Uses descriptive activity names to name the activities in the data set

fullData <- merge(fullData, activityLabels, by.x = "Activity", by.y = "V1")
fullData$Activity <- fullData$V2
fullData$V2 <- NULL

## 4. Appropriately labels the data set with descriptive variable names

names(fullData)

# Replacing abbreviations to appropriate and descriptive words

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

names(fullData)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData <- aggregate(. ~ Subject + Activity, fullData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity), ]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
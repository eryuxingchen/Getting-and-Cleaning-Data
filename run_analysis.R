## ====================================================================
## Data for this project may be downloaded manually from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## OR download the data using the following code:

## download.data <- function () {
##        url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fproject## files%2FUCI%20HAR%20Dataset.zip'
##        zipfile <- 'dataset.zip'
##        
##        download.file(url, destfile = zipfile, method = 'curl')
##        unzip(zipfile)
## }

## when the unzipped data is in your working directory, we start with the decompressed UCI HAR Dataset folder.
## ====================================================================




install.packages("data.table")
install.packages("reshape2")

library(data.table)
library(reshape2)


# Read data from files
features <- read.table("UCI HAR Dataset/features.txt")

activity_lables <- read.table("UCI HAR Dataset/activity_labels.txt")


x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## ======================================================================
## In this part, I did all these 4 steps together.

## 1. Merges the training and the test sets to create one data set.

## 2. Extracts only the measurements on the mean and standard deviation for ## each measurement. 

## 3. Uses descriptive activity names to name the activities in the data set

## 4. Appropriately labels the data set with descriptive variable names. 
## ======================================================================

## Column bind y_test and subject_test & add column names Activity and Subject.
ys_test <- cbind(y_test, subject_test)
names(ys_test) = c("Activity","Subject")

## Column bind y_train and subject_train & add column names Activity and Subject.
ys_train <- cbind(y_train, subject_train)
names(ys_train) = c("Activity","Subject")

## row bind ys_test and ys_train
ys_data <- rbind(ys_test, ys_train)

# update values with correct activity names
ys_data[, 1] <- activity_lables[ys_data[, 1], 2]

## row bind x_test and x_train & Change column names of the data from features
x_data <- rbind(x_test, x_train)
names(x_data) = features[,2]


## determine which columns include "mean" or "std" 
ms_features <- grepl("mean|std", features[,2])

## subset the desired columns
x_data <- x_data[, ms_features]

## Column bind ys_data and x_data
onedata <- cbind(ys_data, x_data)


## ======================================================================
## 5. From the data set onedata above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## ======================================================================

## extract all the column names except the first 2 columns
data_labels <- setdiff(colnames(onedata), c("Subject", "Activity"))

melt_data   <- melt(onedata, id = c("Subject", "Activity"), measure.vars = data_labels)

## Take mean of observations per activity per subject.
ave_data  <- dcast(melt_data, Subject + Activity ~ variable, mean)

## use write.table to get a text file from the above Data Frame
write.table(ave_data, "ave_data.txt", row.name=FALSE)


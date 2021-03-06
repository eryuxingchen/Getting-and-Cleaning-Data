# Course projec: Getting and Cleaning Data

offered by Johns Hopkins University through Coursera

## Course Project description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

#### You will be required to submit: 

1) a tidy data set as described below.

2) a link to a Github repository with your script for performing the analysis.

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

#### You should create one R script called run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set.

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Raw data

The were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## How it works?

1) Download the data. Manually Dowload the data from the link above and unzip into your working directory, or use the code provided in run_analysis.R file to download through R. You will have a foldre named "UCI HAR Dataset" in your working directory.

2) Set the parent folder of "UCI HAR Dataset" folder as your woking directory. Put run_analysis.R file in your working directory.

3) Run     source("run_analysis.R")      in RStudio. Needed packages will be downloaded automatically. A new file ave_data.txt will be created in your working directory. And ave_data.txt contains the tidy data.


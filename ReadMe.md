# Read Me

This document explains how the script 'run_Analysis.R' works and how it answers the 'Getting and Cleaning Data Course Projec' questions

---

## Projec Description

The purpose of the project is to demonstrate the student's ability to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis. The data used comes from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data from the site is available [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Assignment tasks
 
Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

---

## Files Submitted

This repository contains the following files submitted for this project:

1. A script file called __'run_Analysis.R'__ which contains the code that performs the analysis
2. A data file called __'tidyData.txt'__ which contains the tidy data set as described in Point 5 of the Assignment
3. A data file called __'dataSet.txt'__ which contains the cleaned data as described in Points 1-4 of the Assignment
4. A file called __'CodeBook.md'__ that describes the variables, the data, and the work performed to clean up the data
5. A file called __'ReadMe.md'__ that explains the assignment submission and how the script works.

---

## Description of Script

The script 'run_Analysis.R' performs the following tasks in sequential order:

1. Check if data files exist in current working directory. If the data files do no exist, download and unzip all the files to the working directory
2. Read the following data into R (if data frames already exist in global environment, do not read them again):
     * X_test.txt
     * y_test.txt
     * subject_test.txt
     * X_train.txt
     * y_train.txt
     * subject_train.txt
     * features.txt
     * activity_labels.txt
3. Task 1: Merge the Training and Test set to create one single data set. This is achieved with the rbind() function.
4. Task 2: Extract the mean and standard deviation measurements. This is achieved by first finding all the columns that contain 'mean()' and 'std()' and then subsetting the data with this columns.
5. Task 3: Name the activities in the data set with the description. First, the activity codes from training and testing are merged. A auxiliary ordering number is added to the data as the merge() function will change the order of the rows. Then, the data codes are merged with the activity descriptions. The activity data is re-organized to the original order and then added to the measurement data.
6. Task 4: Label the data set by adding descriptive names to the columns. The columns are named with the descriptions found in the 'features.txt' file
7. Task 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. First, the subject data from the training and test sets is merged and added to the measurement data. This data is saved in the __'dataSet.txt'__ file. 
Finally, the tidy data set is created by melting the data from __'dataSet.txt'__ which contains the Activity and Subject for each measurment, and then casting the data to find the mean of each measurment. The final, tidy data is saved in the file __'tidyData.txt'__.
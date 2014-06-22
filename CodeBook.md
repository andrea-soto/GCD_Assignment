# Code Book

This Code Book is part of the Getting and Cleaning Data Course Projec submission. It describes the variables, data, and work performed to clean up the data and create the final 'tidyData.txt' file.

---

## The Raw Data Set

The raw data was distributed in 6 files as following:
* X_test.txt 		- Contains the measurments of the test group
* X_train.txt 		- Contains the measurments of the training group
* y_test.txt 		- Contains the Activity ID of the test group 
* y_train.txt 		- Contains the Activity ID of the training group 
* subject_test.txt 	- Contains the Subject ID of the test group
* subject_train.txt 	- Contains the Subject ID of the training group

The description of the activities is contained in the file 'activity_labels.txt', and the column names for the measurment data ('X_' files) is contained in the file 'features.txt'.

---

## The Cleaned Data Set

The cleaned data set is found in the file 'dataSet.txt'. This file is created with the 'run_Analysis.R' scrip and is used to create the final 'tidyData.txt' file.

The following operatins were performed to the raw data to obtain the cleaned data:
1. Merge the training and test measurment data
2. Extract the data for the mean and standart deviation (called mean() and std())
3. Add the activity description to each record
4. Adds the subject ID to each record

### Summary of Variables

* Number of Rows: 10,299
* Number of Columns: 68

Columns 1 to 66
..Formant: Numeric
..Content: Mean and standard deviation of 33 measured variables.
2. Column 67
..Format:  Character
..Content: Activity description. There are 6 possible activities:
..* LAYING
..* SITTING
..* STANDING
..* WALKING
..* WALKING_DOWNSTAIRS
..* WALKING_UPSTAIRS
3. Column 68
..Format:  Numeric
..Content: Subject identifier from 1 to 30.

---

## Tidy Data Set

The tidy data set is found the in the file 'tidyData.txt' and contains the average measurment of each Activity and Subject. The tidy data was created with the cleaned data described above.

The following operatins were performed to the cleaned data to obtain the tidy data:
1. Melted to create a single row for each Activity-Subject-Measurment record in the cleaned data
2. Summarized with the dcast() function to average the measurments by Activity and Subject

### Summary of Variables

* Number of Rows: 180
* Number of Columns: 68

1. Column 1
..Format:  Numeric
..Content: Subject identifier from 1 to 30.
2. Column 2
..Format:  Character
..Content: Activity description. There are 6 possible activities:
..* LAYING
..* SITTING
..* STANDING
..* WALKING
..* WALKING_DOWNSTAIRS
..* WALKING_UPSTAIRS
3. Columns 3 to 68
..Formant: Numeric
..Content: Average of the mean and standard deviation of 33 measured variables.
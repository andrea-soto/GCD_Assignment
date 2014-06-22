run_Analysis <- function() {
     
     ## Getting and Cleaning Data - Course Project 
     # x: Measured Data
     # y: Activity ID
     # s: Subject ID
     # features: Column labels of the Measured Data (x)
     # activityLabels: Links the activity ID with the respective activity label
     
     ## Check if data files exist in current working directory
     ## If data files do no exist, download and unzip files to working directory
     if(!file.exists("./UCI HAR Dataset")) {     
          fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
          temp <- tempfile()
          download.file( fileUrl, temp)
          unzip(temp)
          unlink(temp)
     }
     
     ## Read data into R
     ## If data frame already exists in environment, do not read again (save time)
     if(!exists("xTest")){
          xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
     }
     if(!exists("yTest")){
          yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
     }
     if(!exists("sTest")){
          sTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
     }  
     if(!exists("xTr")){
          xTr <- read.table("UCI HAR Dataset/train/X_train.txt")
     }
     if(!exists("yTr")){
          yTr <- read.table("UCI HAR Dataset/train/y_train.txt")
     }
     if(!exists("sTr")){
          sTr <- read.table("UCI HAR Dataset/train/subject_train.txt")
     }   
     if(!exists("features")){
          features <- read.table("UCI HAR Dataset/features.txt")
     }
     if(!exists("activity")){
          activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
     }
     
     #------------------------------------------------------------------
     ## 1. Merge the Training and Test set to create one single data set
     xAllRawData <- rbind(xTr, xTest)
     
     #------------------------------------------------------------------
     ## 2. Extract the mean and standard deviation measurements
     meanRows <- grep("mean()", features[,2], fixed=T)
     stdRows  <- grep("std()", features[,2], fixed=T)
     
     dataSet <- xAllRawData[,c(meanRows, stdRows)]
     
     #------------------------------------------------------------------
     ## 3. Name the activities in the data set with the description
     # Merge the training and test Activity IDs
     yData <- rbind(yTr, yTest)
     yData$OrderNo <- 1:dim(yData)[1]
     
     # Merge activity IDs with activity labels
     yData <- merge(yData, activityLabels, by="V1", sort = FALSE)
     # Order data to original order (order was lost during merge)
     yData <- yData[order(yData$OrderNo),]
    
     # Add activity label to data set
     dataSet <- cbind(dataSet, yData$V2)

     #------------------------------------------------------------------
     ## 4. Label the data set by adding descriptive names to the columns
     names(dataSet) <- c(as.character(features[c(meanRows, stdRows), 2]), "Activity")   
     
     #------------------------------------------------------------------
     ## 5. Creates a second, independent tidy data set with the average 
     ##    of each variable for each activity and each subject. 
     
     # Merge the training and test Subject IDs
     sData <- rbind(sTr, sTest)
     names(sData) <- "Subject"
     
     # Add Subject IDs to data set
     dataSet <- cbind(dataSet, sData)
     
     write.table(dataSet, file="dataSet.txt")
     
     # Create final tidy data with the average of each variable by Activity and Subject
     
     
     library(reshape2)
     tidyData <- melt(dataSet, c("Subject", "Activity"))
     tidyData <- dcast(tidyData, Subject + Activity ~ variable, mean)
     
     write.table(tidyData, file="tidyData.txt")
     
}
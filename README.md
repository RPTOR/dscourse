# Data Science Course: Getting and Cleaning Data

Script: run_analysis.R

Date: 11 Dec 2018

Version: 1.0 

Description: 

This script was created to perform data manipulation and cleansing over input file(s) as part of the assignment. 
There are 8 files which needed to be downloaded and 5 different sections which completes the overall assignment.

- 'train/X_train.txt': Training data set.
- 'train/y_train.txt': Training data labels.
- 'train/subject_train.txt': Training data subject id
- 'test/X_test.txt': Test data set
- 'test/y_test.txt': Test data labels
- 'test/subject_test.txt': Test data subjects id 
- 'activity_labels.txt': Links the data labels with their activity name (i.e. 1 - WALKING, 2 - WALKING_UPSTAIRS)
- 'features.txt': Description of the columns in all the data set

The script will perform the following data manipulation within the corresponding section:-

- Setup: Setup of working directory and reads in the files into different data frames

- Section 1: Merges the training and the test sets to create one data set 
  This includes setting up the labels, merging both test and training data and finally combines the subject information with the data set into a final large dataset

- Section 2: Extracts only the measurements on the mean and standard deviation for each measurement
  Based on the column headers which has the word "mean()" and "std()" - exports it into another list (meanstd_data)

- Section 3: Uses descriptive activity names to name the activities in the data set
  The current activities which had been merged into the main dataset is now in codes (1 through 6), using activity_labels as reference, it will replace the numbers with actual activities description

- Section 4: Appropriately labels the data set with descriptive variable names.
  The current labels are carrying abbreviations which needs to be translated (i.e. t = time, f = frequency). This part of script will replace the occurances into full descriptions

- Section 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  5.1 From the main dataset, perform mean function on all the values but to group by subject and activities
  5.2 Rewrites the output of 5.1 into a file as part of final submission

Running: 
This script requires the unzipped file getdata%2Fprojectfiles%2FUCI HAR Dataset.zip which was provided as part of the course. The file needs to be unzipped over the same working directory of the run_analysis.R file prior to running

Below lists out the variables which will be created when run_analysis.R script executes

- activities - Raw data (data frame) read from the file "activity_labels.txt" which consist of activity code and description
- Activities_Desc - Extracting the activity codes from the main data set and replacing the codes with description
- all_data - The combined set of data (list) from training and test
- all_label - The combined label data from both training and test set
- all_subject - The combined subject data from both training and test set
- features - Raw data read from the file "features.txt"
- meanstd_data - Extraction of mean() and std() data from the main data set
- subact_mean - Aggregation of data (based on mean) group by subject and activity
- trd - Raw data read from the file "X_train.txt" (Training data set)
- trl - Raw data read from the file "Y_train.txt" (Training data labels)
- trs - Raw data read from the file "subject_train.txt" (Training data subject)
- tsd - Raw data read from the file "X_test.txt" (Test data set)
- tsl - Raw data read from the file "Y_test.txt" (Test data labels)
- tss - Raw data read from the file "subject_test.txt" (Test data subject)

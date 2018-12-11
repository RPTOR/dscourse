
# Setup the environment and reads in the text file

setwd("C:/Users/jameslim/Documents/R/Getting and Cleaning Data/UCI HAR Dataset")

trd <- read.table("./train/X_train.txt")
trl <- read.table("./train/Y_train.txt")
trs <- read.table("./train/subject_train.txt")

tsd <- read.table("./test/X_test.txt")
tsl <- read.table("./test/Y_test.txt")
tss <- read.table("./test/subject_test.txt")

activities <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# 1. Merges the training and the test sets to create one data set.

# 1.1 Combines the data set
all_data <- rbind(trd, tsd)
all_label <- rbind(trl, tsl)
all_subjects <- rbind(trs, tss)

# 1.2 Apply the header names onto the data sets
names(all_subjects) <- c("Subject")
names(all_label) <- c("Activities")
names(activities) <- c("code", "activities")
names(all_data) <- features$V2

# 1.3 Combine all data sets (including header) into a large data set
all_data <- c(all_subjects, all_label, all_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanstd_data <- all_data[grep("mean\\(\\)|std\\(\\)", names(all_data))]

# 3. Uses descriptive activity names to name the activities in the data set

# 3.1 Get all the matching activities description against the data set
Activities_Desc <- activities$activities[match(all_data$Activities, activities$code)]

# 3.2 Merge back the activities description into the main data set
all_data$Activities <- Activities_Desc

# 4. Appropriately labels the data set with descriptive variable names.
names(all_data) <- gsub("^t", "Time", names(all_data))
names(all_data) <- gsub("^f", "Frequency", names(all_data))
names(all_data) <- gsub("Mag", "Magnitude", names(all_data))
names(all_data) <- gsub("Gyro", "Gyroscope", names(all_data))
names(all_data) <- gsub("Acc", "Accelerometer", names(all_data))
names(all_data) <- gsub("BodyBody", "Body", names(all_data))
names(all_data) <- gsub("^a", "A", names(all_data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# 5.1 Performs aggregation based on Subject and Activities using aggregate function
subact_mean <- aggregate(.~Subject+Activities, all_data, mean)

# 5.2 Writes output into a file
write.table(subact_mean, file = "tidydata.txt", row.name=FALSE)


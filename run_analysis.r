# This R script cleans the data for further analysis. 
# The data sets are obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The code does the following:
## Step 1: Merges the training and the test sets to create one data set.
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
## Step 3: Uses descriptive activity names to name the activities in the data set
## Step 4: Appropriately labels the data set with descriptive variable names. 
## Step 5: From the data set in step 4, creates a second, independent tidy data set.
## The new dataset has the average of each variable for each activity and each subject.

	## Step 1: Merges the training and the test sets to create one data set.

	temp1 <- read.table("train/X_train.txt")
	temp2 <- read.table("test/X_test.txt")
	mergedXvalue <- rbind(temp1, temp2)

	temp1 <- read.table("train/subject_train.txt")
	temp2 <- read.table("test/subject_test.txt")
	mergedSubject <- rbind(temp1, temp2)

	temp1 <- read.table("train/y_train.txt")
	temp2 <- read.table("test/y_test.txt")
	mergedYvalue <- rbind(temp1, temp2)

	
	
	## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

	featuresList <- read.table("features.txt")
	selected_features <- grep("-mean\\(\\)|-std\\(\\)", featuresList[, 2])
	X <- mergedXvalue[, selected_features]
	names(X) <- featuresList[selected_features, 2]
	names(X) <- gsub("\\(|\\)", "", names(X))
	names(X) <- tolower(names(X))

	
	
	# 3. Uses descriptive activity names to name the activities in the data set.
	Y<- mergedYvalue
	activityList <- read.table("activity_labels.txt")
	activityList[, 2] = gsub("_", "", tolower(as.character(activityList[, 2])))
	Y[,1] = activityList[Y[,1], 2]
	names(Y) <- "activity"

	
	
	# 4. Appropriately labels the data set with descriptive activity names.

	names(mergedSubject) <- "subject"
	cleanData <- cbind(mergedSubject, Y, X)
	write.table(cleanData, "merged_clean_data.txt")

	
	
	# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

	uniqueSubjects = unique(mergedSubject)[,1]
	numSubjects = length(unique(mergedSubject)[,1])
	numActivities = length(activityList[,1])
	numCols = dim(cleanData)[2]
	
	## write tidy data set of each variable for each activity
	results = cleanData[1:(numSubjects*numActivities), ]

				row = 1
				for (s in 1:numSubjects) {
						  for (a in 1:numActivities) {
									results[row, 1] = uniqueSubjects[s]
									results[row, 2] = activityList[a, 2]
									tmp <- cleanData[cleanData$subject==s & cleanData$activity==activityList[a, 2], ]
									results[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
									row = row+1
						  }
				}
	## write tidy data set with averages
	write.table(results, "data_set_with_the_averages.txt")
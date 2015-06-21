#CodeBook

This codebook describes the variables, data and the transformation done to the downloaded dataset

##Following describes the cleaned dataset saved by the script as merged_clean_data_set.txt:

This dataset has 10299 observation of 68 variables
The variables are listed below with the line number shown in [], these variables are selected based on "mean" or "std" appearing in the description as per the assignment criteria: 

Note: variables [1] "subject" and [2] "activity"  are used to order the rows of the set.


 [1] "subject"                   "activity"                  
 [3] "tbodyacc.mean.x"          
 [4] "tbodyacc.mean.y"           "tbodyacc.mean.z"           "tbodyacc.std.x"           
 [7] "tbodyacc.std.y"            "tbodyacc.std.z"            "tgravityacc.mean.x"       
[10] "tgravityacc.mean.y"        "tgravityacc.mean.z"        "tgravityacc.std.x"        
[13] "tgravityacc.std.y"         "tgravityacc.std.z"         "tbodyaccjerk.mean.x"      
[16] "tbodyaccjerk.mean.y"       "tbodyaccjerk.mean.z"       "tbodyaccjerk.std.x"       
[19] "tbodyaccjerk.std.y"        "tbodyaccjerk.std.z"        "tbodygyro.mean.x"         
[22] "tbodygyro.mean.y"          "tbodygyro.mean.z"          "tbodygyro.std.x"          
[25] "tbodygyro.std.y"           "tbodygyro.std.z"           "tbodygyrojerk.mean.x"     
[28] "tbodygyrojerk.mean.y"      "tbodygyrojerk.mean.z"      "tbodygyrojerk.std.x"      
[31] "tbodygyrojerk.std.y"       "tbodygyrojerk.std.z"       "tbodyaccmag.mean"         
[34] "tbodyaccmag.std"           "tgravityaccmag.mean"       "tgravityaccmag.std"       
[37] "tbodyaccjerkmag.mean"      "tbodyaccjerkmag.std"       "tbodygyromag.mean"        
[40] "tbodygyromag.std"          "tbodygyrojerkmag.mean"     "tbodygyrojerkmag.std"     
[43] "fbodyacc.mean.x"           "fbodyacc.mean.y"           "fbodyacc.mean.z"          
[46] "fbodyacc.std.x"            "fbodyacc.std.y"            "fbodyacc.std.z"           
[49] "fbodyaccjerk.mean.x"       "fbodyaccjerk.mean.y"       "fbodyaccjerk.mean.z"      
[52] "fbodyaccjerk.std.x"        "fbodyaccjerk.std.y"        "fbodyaccjerk.std.z"       
[55] "fbodygyro.mean.x"          "fbodygyro.mean.y"          "fbodygyro.mean.z"         
[58] "fbodygyro.std.x"           "fbodygyro.std.y"           "fbodygyro.std.z"          
[61] "fbodyaccmag.mean"          "fbodyaccmag.std"           "fbodybodyaccjerkmag.mean" 
[64] "fbodybodyaccjerkmag.std"   "fbodybodygyromag.mean"     "fbodybodygyromag.std"     
[67] "fbodybodygyrojerkmag.mean" "fbodybodygyrojerkmag.std" 

##Following describes the cleaned dataset saved by the script as data_set_with_the_averages.txt:

This dataset has the 180 observations of 68 variables as shown above. This independent tidy data set has the average of each variable for each activity and each subject.

##Original dataset description:

The data sets are derived from the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Transformation carried out:
===========================
Step 1: Merges the training and the test sets to create one data set.
	After reading the raw data into temp files, they are merged together using merged Y value set using the format.
	merged_value <- rbind(temp1, temp2)
	
Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	This is achieved using grep(), names(), gsub() and tolower() functions based on the "featuresList" created using the features.txt.
	This allows the extraction of certain variable. This data set is called X 
	
Step 3. Uses descriptive activity names to name the activities in the data set.
	Descriptive variable names are derived from the "activityList" which is created using the "activity_labels.txt" from raw data.
	This data set is called Y
	
Step 4. Appropriately labels the data set with descriptive activity names.
	Merged subject list is combined with appropriate labels and using cbind() on X and Y referred above.
	The output of this step is saved as "merged_clean_data.txt"
	
Step 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
	Through subject index "s" looping through "numSubjects" (number of uniqe subject identifiers), a nested loop is cretaed for activity "a".
	Column means for each variable, per unique subject per activity is caluculated and stored as "results".
	This data is saved as "data_set_with_the_averages.txt" using write.table(x, " ", row.names = FALSE) for submission.
	
	
The Codebook
============

The Variables
-------------------
The orginal study gathered accelerameter information on 30 test subjects (identified by number ranging from 1 to 30) while they engaged in 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING).

Multiple samples of each participant doing each activity was taken.  The samples were separated into training and test data sets to allow UCI to develop machine learning algorithms.  The data in both of these data sets is identical.

For each observation, the following accelerameter and gyrascope measurements were taken:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Note:  variables ending in -XYZ are actually 3 sets of measurements on each the X, Y and Z axis.

For each variable above, the more than 15 values were computed.  For our analysis, we extacted only the mean and standard deviation data for each measurement and returned the mean of dataset grouping by subject and activity label.

Additional information on the original study and how the data was processed can be found below.

The Units of Measurement
------------------------
The raw data in the study comes in three different types of units:

- Total Acceleration data - The acceleration signal from the smart phone accelerameter measured in standard units of 'g'.
- The Body Acceleration data - Obtained by subtracting gravity from the Total Acceleration data.  Standard unit remains 'g'.
- The Body Gyro data - The angular velocity measured by the gyroscope in radian per second.  

The UCI feature data is all normalized and bounded between -1 and 1.  For each variable, the units of measurement will be unchanged in the returned data table.

The Transformation
------------------
All of the work in this script was done in the data.table format.  The function will load the needed libraries when run.  

The script undergoes the following steps to convert the raw data into the processed dataset:

1. From the top-level directory, the activity labels are loaded from the "Activity_labels.txt" file and the feature names are loaded from the "features.txt" file.
2. In the test folder, the "X_test.txt" dataset is loaded and column names are added from the "features.txt" file.  The same function is also run on the "X_train.txt" file in the train folder.
3. Columns which contain either a mean or a standard deviation in both the X_test and X_train datasets are identified.  All other columns are removed.
4. Subject data is added to the X_test and X_train data.  The subject identifiers are found in two files.  Both files are called "subject_test.txt" and can be found in the test and train folders, respectively.  The subject columns is renames "subject" in both the X_test and X_train data tables.
5. Activity identifiers are added to both the X_test and X_train data tables.  In both cases, the indentifiers are loaded (from "test/y_test.txt" and "train/y_train.txt" respectively) and added to existing data tables.  Plain english activity identifiers are also added from the "activity_labels.txt" file that was loaded in step (1) above.
6. At this point, the X_test and X_train data tables are combined using rbind.
7. The columns are reordered to increase the readability of the table by putting subject, activity label information in the first columns.
8. A mean by subject and activity label is taken.  Note the activity key column is intentionally lost in this operation again to make the resulting table as concise and readable as possible.  No information is lost in this operation as the activity_key data is a duplicate of the more expressive activity_name data.

Output Data
-----------
The run_analysis() function returns a data table containing columns for the mean and standard deviations from the original data sets.  All other variable were removed.

The more than 10,000 observations in the original data set are summarize by taking the mean of each subject and each activity.

Additional Reading
------------------
Detailed information on the original UCI HAR Dataset can be found in several places:

1. At [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the UCI Machine Learning Repository.
2. feature_info.txt - found in the UCI HAR .zip file.  
3. README.txt  - found in the UCI HAR .zip file.

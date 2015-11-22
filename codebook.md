The Codebook
============

The Variables
=============


The Transformation
==================
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

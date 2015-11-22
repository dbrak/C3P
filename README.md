# C3P
This repository contains a single script, run_analysis.R, that takes accelerameter data captured for 30 subjects on Samsung Galaxy smartphones and returns a new dataset containing 79 measurements for each of the 30 subjects for up to 6 activities each.  The returned valus is the mean of the normalized raw data.

The detailed description of the work done by the script can be found in the codebook in this repository.

The data was originally captured by University of California Irving's Center for Machine Learning and Intelligent Systems ("UCI").


##Running the Analysis
To run the analysis, execute the following steps:

1. Download the data using [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip and put the data into a folder on your computer.  The Getting Data section provides a short description of the expected format.
3. The top-level folder in the zip file is called "UCI HAR Dataset'.  Naviate to this folder in the console and set it as your working directory in R using setwd() function in R.
4. Download the 'run_analysis.R' file from this repo and source the script into R using the source() function.  If you are using Rstudio, at this point you will see a run_analysis() function added to your workspace.
5. From the "UCI HAR Dataset" folder in the console, run the function by typing:  run_analysis()

These steps will return a new data.table.

##The Data
The UCI HAR Dataset can be renamed if you desire and the run_analysis function will still work as long as you have set your working directory correctly.  

Inside the UCI HAR folder, the names and locations of files are required for the script to run properly.  Please do not change the location of any of the subfolders or rename any of the files inside the UCI HAR Dataset.

If you encounter difficulties downloading the data set from the link above, the original data set can be retreived from [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).




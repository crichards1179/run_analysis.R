# run_analysis.R
This repository is for the Week 4 programming assignment in the Coursera "Getting and Cleaning Data" course.

This repo contains one R script, "run_analysis.R", that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data Source

    The original data files used in the analysis can be downloaded from:
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    The files should be unzipped to the user's current working directory.

Required R packages

    The "reshape2" package is required to run the script.

Final Output

    Running the script results in the final tidy data set of aggregated means and std variables saved in the file "Wk4_tidy_data.txt".  The script saves the file in the user's current working directory.


Please refer to the CodeBook.md file for information on the steps taken during the analysis.

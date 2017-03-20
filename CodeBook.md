The data used in this analysis represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  Here are the data for the project:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
The data analysis is performed by extracting the raw data files into the user's current working directory.  Running the run_anlysis.R script will perform the following transformations on the data files:

	1. Loads the necessary data files from the working directory.  Those files are:
		features.txt
		activity_labels.txt
		X_test.txt
		y_test.txt
		subject_test.txt
		X_train.txt
		y_train.txt
		subject_train.txt
	
	2. Combines the data tables according to table dimensions using rbind and cbind.
	3. Merges descriptive labels found in the "features" and "activity_labels" tables.
	4. Extracts the columns containing "mean" and "std" in their column names to form a smaller data set for further analysis.
	5. Reshapes the data set from Step 4 using "melt", setting the "subject" and "datlabel" columns as ID variables.
	6. Further reshapes the data table using "dcast" to create rows by combining the ID variables from Step 5.
	7. The mean for each of the measured variable columns created in Step 5 are calculated as part of the "dcast" in Step 6.
	8. The resulting tidy data set is saved to as a file, "Wk4_tidy_data.txt", in the user's working directory.

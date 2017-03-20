The data used in this analysis represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
	
Data Set Information:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

	For each record in the dataset it is provided:
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope.
	- A 561-feature vector with time and frequency domain variables.
	- Its activity label.
	- An identifier of the subject who carried out the experiment. 

Original authors of the study:
	Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
	1 - Smartlab - Non-Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
	2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
	Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
	activityrecognition '@' smartlab.ws 

  
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

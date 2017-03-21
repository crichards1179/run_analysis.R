library(reshape2)

#------------------------------------------------------------------------
# Load data tables
#------------------------------------------------------------------------
features <- read.table("./UCI HAR Dataset/features.txt")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# test data
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# train data
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#------------------------------------------------------------------------
# Combine data tables.  Rename column to "subject".
#------------------------------------------------------------------------
#Combine subject data
sub <- rbind(testsubject, trainsubject)
colnames(sub) <- "subject"

# Combine testy & trainy data with rbind.  
#Merge activity descriptions from 2nd column of activity labels with column in datlabel.
datlabel <- rbind(testy, trainy)
datlabel <- merge(datlabel, activitylabels, by=1)[,2]

# Combine testx & trainx data with rbind.  Replace 
dat <- rbind(testx, trainx)
colnames(dat) <- features[,2]

# Final combine -  combine columns of all three sets (x, y and subject)
datamerged2 <- cbind(sub, datlabel, dat)

#------------------------------------------------------------------------
# Search for "mean" and "std" columns using grep on column names
#------------------------------------------------------------------------
#searchterms <- c("-mean", "-std")
#targets <- grep(searchterms, colnames(datamerged))
targets <- grep("mean|std", colnames(datamerged), value = FALSE )

#------------------------------------------------------------------------------------
# Subset first and second columns and only "mean" and "std" columns from merged data
#------------------------------------------------------------------------------------
stdmeans <- datamerged[, c(1,2, targets)]

#---------------------------------------------------------------------------------
# Create molten data set from stdmeans.  ID variable are "subject" and "datlabel".
# Other columns are measured variables and are handled by default.
#---------------------------------------------------------------------------------
melteddata = melt(stdmeans, id.var = c("subject", "datlabel"))

#------------------------------------------------------------------------
# Reshape molten data using dcast.  Subject and datalabel columns form a 
# "composite key".  The measured variable data are the remaining columns.
# Data is aggregated using the means function.
#------------------------------------------------------------------------
finalmeans = dcast(melteddata , subject + datlabel ~ variable, mean)

#------------------------------------------------------------------------
# Save the tidy data using write.table
#------------------------------------------------------------------------
write.table(finalmeans, file = "Wk4_tidy_data.txt")
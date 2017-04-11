## Load the reshape2 package to use for this project
## =================================================
library(reshape2)

## Set the directory to where the files have been downloaded...
## ============================================================
setwd("data/UCI HAR Dataset")

## Get test data ... this is the directory where the TEST data files need to be extracted
## This is a sub-directory of /UCI HAR Dataset
## ======================================================================================
setwd("test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

## Get out of sub-directory
## ========================
setwd("..")

## Get training data ... this is the directory where the TRAINING data files need to be extracted
## This is a sub-directory of /UCI HAR Dataset
## ==============================================================================================
setwd("train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

## Merges the training and the test sets to create one data set
## ============================================================

## Add column name for subject files
## =================================
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

## Get out of sub-directory
## ========================
setwd("..")

## Add column names for measurement files
## ======================================
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

## Add column name for label files
## ===============================
names(y_train) <- "activity"
names(y_test) <- "activity"

## Combine files into one dataset
## ==============================
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)

## Extracts only the measurements on the mean and standard
## deviation for each measurement.
## =======================================================

## Determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
  grepl("std\\(\\)", names(combined))

## Ensure that we also keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

## Remove unnecessary columns
combined <- combined[, meanstdcols]

## Appropriately labels the data set with descriptive activity names. 
## convert the activity column from integer to factor
## ==================================================================
combined$activity <- factor(combined$activity, labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## Creates a independent tidy data set with the
## average of each variable for each activity and each subject.
## ============================================================

## Create the tidy data set
## ========================
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

## Write the tidy data set and save it as a Text file
## ==================================================
write.table(tidy, "tidy.txt", sep="\t", row.names=FALSE)

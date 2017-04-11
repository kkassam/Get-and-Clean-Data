# Assignment Project for "Getting and Cleaning Data"

The class project for Getting and Cleaning Data involves downloading data from the URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Once downloaded, the process is to merge the data sets with their specific headers (column name) and perform analysis and output a tidy data set.

**Below are the steps that must be performed before running the R script:**
Download the zip file
Unzip the files including the sub-directories or Train and Test
Confirm the working directory as per the R Script to make sure this is where the files are downloaded
The Rest is all handled in the script i.e. the R Script will move in and out of the sub-directories with the assumption the the sub-directories and files within will not be reloacted
Once all the above is done, you can run the R script "run_analysis.R" and just to note that this project requires the reshape2 package which should be loaded first in R-Studio or http://cran.r-project.org/web/packages/reshape2/index.html, and can be downloaded from CRAN.

The output of the R script is a tidy data set, "tidy.csv"

You can read more about the data and the analysis in the code book called CodeBook.md

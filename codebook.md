# "getdata" course project #
course project for "Getting And Cleaning Data" course.

transformating script: **run_analisys.r**

**main function:** merge.UCI.HAR()

**source data for script:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Analysis script requires unzipped archive in the same folder.

**Main function** does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 

function **getDFofMeans(total)**
	
input: total - dataframe, as returned by main function

output: Dataframe with the average value of each variable for each couple of (activity, subject)	
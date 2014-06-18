# Coursera "Getting and Cleaning Data" 6/2014
# Project

# Problem statement:
# You should create one R script called run_analysis.R that does the following. 
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. Creates a second, independent tidy data set with the average of each
#     variable for each activity and each subject.


# Part 1: merge data sets -------------------------------------------------

# Load one (test or train) raw dataset
loadSet <- function (path, category)
{
  # Parameter path is the root directory of the raw datasets.
  # Category: in this case, "test" or "train".
  file.path (path, paste ('X_', category, '.txt', sep=''))
}



# Part 2: compute mean and SD ---------------------------------------------


# Part 3: Use descriptive activity names ----------------------------------


# Part 4: Label data with descriptive variable names ----------------------


# Part 5: create tidy data set --------------------------------------------



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

# Approach, and a table of contents for the source below:

# In part 0, the function run_analysis performs all five steps of the project,
#  (almost) in order. To accomplish this, it calls functions defined lower in the
#  file, in subsequent parts.
# Parts 1--5 are auxiliary functions for each step of the project.

# Data citation:
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
# Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass
# Hardware-Friendly Support Vector Machine. International Workshop of Ambient
# Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

# Part 0: Pull the parts together -----------------------------------------

# The tidy data set comprises two data frames: one for feature vector means by
# Subject, one for means by Label.

run_analysis <- function (root = 'UCI HAR Dataset')
{
  # Part 1: Load both datasets (test and train) and combine them into a single data frame
  varNames <- read.table (file.path (root, 'features.txt'))
  train <- loadSet (file.path (root, 'train'), 'train', varNames$V2)
  test <- loadSet (file.path (root, 'test'), 'test', varNames$V2)
  merged <- rbind (train, test)
  
  # Part 2: Select mean and SD variables
  selected <- selectMatchingVariables (merged)
  
  # Part 3: Replace activity indices with descriptive names
  described <- replaceActivityNames (selected, root)
  
  # Part 4: already done in step 1! :-D
  
  # Part 1--4 completion: store the tidy dataset
  write.table (described, 'Tidy.txt')
  
  # Part 5: Create and save tidy data sets averaged by Subjects and by Labels
  bySubjects <- averageFeatureVectors (described, c ('Subjects', 'Labels'))
  write.table (bySubjects, 'TidyMeans.txt')
}


# Part 1: merge data sets -------------------------------------------------

# Load one (test or train) raw dataset
loadSet <- function (path, category, names)
{
  # Parameter path is the root directory of the raw datasets.
  # Category: in this case, "test" or "train".
  # Names: variable names for data frame
  
  # Load feature vectors
  fPath <- file.path (path, paste ('X_', category, '.txt', sep=''))
  XRaw <- read.table (fPath, col.names=names) #Part4: use descriptive variable names
  
  # Load labels
  fPath <- file.path (path, paste ('y_', category, '.txt', sep=''))
  XRaw$Labels <- read.table (fPath)$V1
  
  # Load subject IDs
  fPath <- file.path (path, paste ('subject_', category, '.txt', sep=''))
  XRaw$Subjects <- read.table (fPath)$V1
  
  # Return result
  XRaw
}

# Part 2: Select values representing mean and SD ---------------------------------------------

# Select only those columns in a dataset whose names match a regular expression
selectMatchingVariables <- function (frame, regex='mean|std|^Subjects$|^Labels$')
{
  frame [, grep (regex, names (frame))]
}

# Part 3: Use descriptive activity names ----------------------------------

library (plyr)

# Pull descriptive names from a file and store them in data frame
replaceActivityNames <- function (frame, root)
{
  aNames <- read.table (file.path (root, 'activity_labels.txt'))
  frame$Labels <- aNames$V2[frame$Labels]
  frame
}

# Part 4: Label data with descriptive variable names ----------------------

# This was completed in part 1: see the comment there "Part4", where the
# col.names parameter to read.table assigns descriptive names to variables.

# Part 5: create new tidy data sets ---------------------------------------

# Average values of all (other) columns grouped by a specified variable.
averageFeatureVectors <- function (df, by)
{
  ddply (df, c(by), colwise (mean))
}

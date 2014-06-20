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

# Data:
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
# Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass
# Hardware-Friendly Support Vector Machine. International Workshop of Ambient
# Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


# Part 1: merge data sets -------------------------------------------------

# Load one (test or train) raw dataset
loadSet <- function (path, category, names)
{
  # Parameter path is the root directory of the raw datasets.
  # Category: in this case, "test" or "train".
  # Names: variable names for data frame
  
  # Load feature vectors
  fPath <- file.path (path, paste ('X_', category, '.txt', sep=''))
  XRaw <- read.table (fPath, col.names=names)
  
  # Load labels
  fPath <- file.path (path, paste ('y_', category, '.txt', sep=''))
  yRaw <- read.table (fPath)
  cbind (yRaw, XRaw)
}

loadAllSets <- function (root)
{
  # Parameter root is root directory of raw datasets.
  varNames <- read.table (file.path (root, 'features.txt'))
  train <- loadSet (file.path (root, 'train'), 'train', varNames$V2)
  test <- loadSet (file.path (root, 'test'), 'test', varNames$V2)
  rbind (train, test)
}

# Part 2: Select values representing mean and SD ---------------------------------------------


# Part 3: Use descriptive activity names ----------------------------------


# Part 4: Label data with descriptive variable names ----------------------


# Part 5: create tidy data set --------------------------------------------



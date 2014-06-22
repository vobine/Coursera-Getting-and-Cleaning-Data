# Getting and Cleaning Data (Coursera)

Data Science 3
Course project

## List of included files

* *Tidy.txt* is output from R `write.table` containing a data frame representing the tidy dataset specified by parts 1--4 of the project instructions, comprising:
  * All observations from both (training and test) raw datasets of 561-dimensional feature vectors. The training set contributes 7352 observations and test adds 2947.
  * Every observation has had its dimensionality reduced to 79 dimensions, which include only those variables that represent means or standard deviations.
  * An additional column, "Subjects," to identify which subject performed in each observation.
  * An additional column, "Labels," to identify the activity associated with each observation. The Labels are presented in English, e.g., "WALKING," "SITTING," etc., rather than as factors or indices.
  * Variable names are mnemonic, e.g., "tBodyAcc.mean...Y" is the mean of the Body component (with Gravity filtered out) of Y-axis output from the Accelerometer. The leading "t" indicates this is a time-domain signal, as opposed to "f" for frequency-domain.

* *TidyMeans.txt* is output from R `write.table` containing a data frame representing the tidy dataset specified by part 5 of the project instructions. It comprises mean values for each of the 79 dimensions in the pruned feature vector, grouped by all 180 combinations of Subject, of whom there are 30, and Label, of which there are 6.

* *run_analysis.R* is an R script to read data as distributed from UCI and produce the output datasets *Tidy.txt* and *TidyMeans.txt*.


## Code book

Each variable in the feature vector is dimensionless, with values normalized to the interval [-1, 1].

Each variable name in the feature vector is composed of three parts:
* the *root name* to describe the source of the data, as enumerated below;
* the *summary*, which describes the summarization process to produce the variable, either "mean" for mean or "std" for standard deviation; and
* the *axis*, either "X", "Y", or "Z".

Variable root names:

  * *fBodyAcc*: FFT of accelerometer body component with gravitational acceleration filtered out.
  * *fBodyAccJerk*: FFT of first derivative of accelerometer body component with gravitational acceleration filtered out.
  * *fBodyAccMag*: FFT of magnitude of accelerometer body component with gravitational acceleration filtered out.
  * *fBodyBodyAccJerkMag*: FFT of first derivative of magnitude of accelerometer body component with gravitational acceleration filtered out.
  * *fBodyBodyGyroJerkMag*: FFT of first derivative of magnitude of gyroscope body component with gravitational acceleration filtered out.
  * *fBodyBodyGyroMag*: FFT of magnitude of gyroscope body component with gravitational acceleration filtered out.
  * *fBodyGyro*: FFT of gyroscope body component with gravitational acceleration filtered out.
  * *tBodyAcc*: accelerometer body component with gravitational acceleration filtered out.
  * *tBodyAccJerk*: second derivative of accelerometer body component with gravitational acceleration filtered out.
  * *tBodyAccJerkMag*: first derivative of magnitude of accelerometer body component with gravitational acceleration filtered out.
  * *tBodyAccMag*: magnitude of accelerometer body component with gravitational acceleration filtered out.
  * *tBodyGyro*: gyroscope body component with gravitational acceleration filtered out.
  * *tBodyGyroJerk*: first derivative of gyroscope body component with gravitational acceleration filtered out.
  * *tBodyGyroJerkMag*: magnitude of first derivative of gyroscope body component with gravitational acceleration filtered out.
  * *tBodyGyroMag*: magnitude of gyroscope body component with gravitational acceleration filtered out.
  * *tGravityAcc*: gravity coponent of accelerometer.
  * *tGravityAccMag*: magnitude of gravity component of accelerometer.


## How it works

To run the analysis:

1. Download the UCI HAR dataset ZIP file.
1. Unpack the ZIP file, to create and populate a directory named "UCI HAR Dataset".
1. Start R or RStudio.
1. Change to the directory in which you unpacked the ZIP file, i.e., the one that now contains "UCI HAR Dataset" as a subdirectory.
1. run the script:

```R
source ('run_analysis.R')
run_analysis ()
```

The result will be tidy datasets named "Tidy.txt" and "TidyMeans.txt" in the working directory.

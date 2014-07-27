Some of this information has been take directly from the Human Activity Recognition Using Smartphones Dataset documentation.

Underlying Data Description
===========================


The experiments whose observation make up this dataset was carried out 30 volunteers between the ages of 19 and 48.
Each person performed the following six activities (here listed with the numbers by which the activities were referred in the dataset):
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The sensor signals (accelerometer and gyroscope) have had a variety of of filters already applied to them (more information can be found in the UCI HAR Dataset README.txt, features.txt, and features_info.txt files).
From the UCI HAR Dataset I used the following files:
features.txt - a list of all the features.  This was used for labeling the data.
activity_labels.txt - a list of all the classes and their names (see above)
train/X_train.txt - the training dataset
test/X_test.txt - the test dataset
train/y_train.txt - training set labels
test/y_test.txt - test set labels
train/subject_train.txt - lists the subject that performed each activity

The following is an excerpt from the features_info.txt file in the UCI HAR Dataset documentation.

"These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean"

Script Guide
============

This was take directly from my README.md file.
This includes an R script (run_analysis.R) that sorts the data into a tidier dataset as well as an output file (tidy_data.txt).


The script fetches data from the training and testing datasets, the activities dataset, and the features dataset.
It then adds the features as the column names to both the training and testing datasets.
The script then adds columns to both the training and testing data sets using the activities dataset.

Next, it uses cbind() to add the training and testing data frames together into the "complete" dataset.

For the first output dataset, the script selects only columns with "mean", "std", "act" (activity variable), and "sub" (subject variable).
For the second output dataset, the script aggregates the "complete" dataset by both activity and subject and finds the mean.

The final step is using write.table to write the second output dataset to tab-separated txt file.

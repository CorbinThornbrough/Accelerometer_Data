Accelerometer_Data
==================
Version 1.0
Corbin Thornbrough

Tidy Version of Samsung Accelerometer Data
==========================================
This includes an R script (run_analysis.R) that sorts the data into a tidier dataset as well as an output file (tidy_data.txt).


The script fetches data from the training and testing datasets, the activities dataset, and the features dataset.
It then adds the features as the column names to both the training and testing datasets.
The script then adds columns to both the training and testing data sets using the activities dataset.

Next, it uses cbind() to add the training and testing data frames together into the "complete" dataset.

For the first output dataset, the script selects only columns with "mean", "std", "act" (activity variable), and "sub" (subject variable).
For the second output dataset, the script aggregates the "complete" dataset by both activity and subject and finds the mean.

The final step is using write.table to write the second output dataset to tab-separated txt file.

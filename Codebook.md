##Study Design

The following steps were undertaken to create the tidy dataset called 'tidy_wide.txt' from the original source data. These steps are performed by the R script called 'run_analysis.R'.

1. Install and load the required R packages if they are not already installed and loaded.
2. (If it does not already exist) create a directory called ‘assignment_data’ in the current working directory, and download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as a temporary file.
3. Unzip the temporary zip file into the folder 'assignment_data'.
4. Read in and combine the tables 'X_test.txt' and 'X_train.txt'. The combined data frame is called 'X' and contains 10299 observations (rows) and 561 variables (columns).
5. Read in the table 'features.txt' which contains the 561 feature names for all the measurements (columns) in 'X'.
   From table 'X', keep only those variables that contain the string 'mean()', 'Mean()', 'std()' or 'Std()'. The resulting data frame is called 'X_sel' and contains 10299 observations and 66 variables.
   As mentioned in the README file, other variables containing the word ‘mean’ like ‘MeanFreq’ were not selected.
6. Read in and combine the tables 'y_test.txt' and 'y_train.txt' which contain the activity id corresponding to each row in X.
   The combined data frame is called 'y' and contains 10299 observations.
7. Read in and combine the tables 'subject_test.txt' and 'subject_train.txt' which contain the subject id corresponding to each row in X.
   The combined data frame is called 'subject' and contains 10299 observations.
8. Combine the data frames 'subject', 'activity' and 'X_sel' into a new data frame called 'all' containing 10299 observations and 68 variables.
9. Read in the table 'activity_labels.txt' and merge with the data set 'all' to assign meaningful activity names corresponding to the activity ids.
10. From the data set 'all' create a tidy data set containing the mean of each variable by subject and activity.
    The tidy dataset is called 'tidy_wide' and contains 180 observations and 68 variables.
    Note: I have produced a tidy data set in the wide format with the following characteristics:
    * each variable is in one column
    * each different observation is in a different row
11. Tidy up the variable names:
    * all lower case
    * remove “()”
    * remove “-“
    * substitute “bodybody” with “body”
12. Write the tidy data frame to 'tidy_wide.txt'.	


##Codebook

The tidy dataset contains the following 68 variables.

Variable name | Variable description  | class/values/units
--------------|-----------------------|---------------------
subject | identifier of the person performing an activity | integer 1 to 30
activity | activity name |	factor with 6 levels 'walking', 'walking_downstairs', 'walking_upstairs', 'standing' and 'laying'
tbodyaccmeanx | body acceleration x axis signal mean | numeric, average by subject and activity id	
tbodyaccmeany | body acceleration y axis signal mean | numeric, average by subject and activity id
tbodyaccmeanz | body acceleration z axis signal mean | numeric, average by subject and activity id
tbodyaccstdx  | body acceleration x axis signal standard deviation | numeric, average by subject and activity id
tbodyaccstdy  | body acceleration y axis signal standard deviation | numeric, average by subject and activity id
tbodyaccstdz | body acceleration z axis signal standard deviation | numeric, average by subject and activity id
tgravityaccmeanx | gravity acceleration x axis signal mean | numeric, average by subject and activity id
tgravityaccmeany | gravity acceleration y axis signal mean | numeric, average by subject and activity id
tgravityaccmeanz | gravity acceleration z axis signal mean | numeric, average by subject and activity id
tgravityaccstdx | gravity acceleration x axis signal standard deviation | numeric, average by subject and activity id
tgravityaccstdy |	gravity acceleration y axis signal standard deviation | numeric, average by subject and activity id
tgravityaccstdz |	gravity acceleration z axis signal standard deviation | numeric, average by subject and activity id
tbodyaccjerkmeanx |	body acceleration x axis jerk signal mean | numeric, average by subject and activity id
tbodyaccjerkmeany	| body acceleration y axis jerk signal mean | numeric, average by subject and activity id
tbodyaccjerkmeanz	| body acceleration z axis jerk signal mean | numeric, average by subject and activity id
tbodyaccjerkstdx	| body acceleration x axis jerk signal standard deviation | numeric, average by subject and activity id
tbodyaccjerkstdy	| body acceleration y axis jerk signal standard deviation | numeric, average by subject and activity id
tbodyaccjerkstdz	| body acceleration z axis jerk signal standard deviation | numeric, average by subject and activity id
tbodygyromeanx	| body angular velocity x axis signal mean | numeric, average by subject and activity id
tbodygyromeany | body angular velocity y axis signal mean | numeric, average by subject and activity id
tbodygyromeanz	| body angular velocity z axis signal mean | numeric, average by subject and activity id
tbodygyrostdx | body angular velocity x axis signal standard deviation | numeric, average by subject and activity id
tbodygyrostdy | body angular velocity y axis signal standard deviation | numeric, average by subject and activity id
tbodygyrostdz | body angular velocity z axis signal standard deviation | numeric, average by subject and activity id
tbodygyrojerkmeanx | body angular velocity x axis jerk signal mean | numeric, average by subject and activity id
tbodygyrojerkmeany | body angular velocity y axis jerk signal mean | numeric, average by subject and activity id
tbodygyrojerkmeanz | body angular velocity z axis jerk signal mean | numeric, average by subject and activity id
tbodygyrojerkstdx | body angular velocity x axis jerk signal standard deviation | numeric, average by subject and activity id
tbodygyrojerkstdy | body angular velocity y axis jerk signal standard deviation | numeric, average by subject and activity id
tbodygyrojerkstdz | body angular velocity z axis jerk signal standard deviation | numeric, average by subject and activity id
tbodyaccmagmean | body acceleration magnitude mean | numeric, average by subject and activity id
tbodyaccmagstd	| body acceleration magnitude standard deviation | numeric, average by subject and activity id
tgravityaccmagmean | gravity acceleration jerk signal magnitude mean | numeric, average by subject and activity id
tgravityaccmagstd	| gravity acceleration jerk signal magnitude standard deviation | numeric, average by subject and activity id
tbodyaccjerkmagmean | body acceleration jerk signal magnitude mean | numeric, average by subject and activity id
tbodyaccjerkmagstd | body acceleration jerk signal magnitude standard deviation | numeric, average by subject and activity id
tbodygyromagmean | body angular velocity magnitude mean | numeric, average by subject and activity id
tbodygyromagstd | body angular velocity magnitude standard deviation | numeric, average by subject and activity id
tbodygyrojerkmagmean | body angular velocity jerk signal magnitude mean | numeric, average by subject and activity id
tbodygyrojerkmagstd | body angular velocity jerk signal magnitude standard deviation | numeric, average by subject and activity id
fbodyaccmeanx | FastFourierTransform (FFT) of body acceleration x axis signal mean | numeric, average by subject and activity id
fbodyaccmeany | FFT of body acceleration y axis signal mean | numeric, average by subject and activity id
fbodyaccmeanz | FFT of body acceleration z axis signal mean | numeric, average by subject and activity id
fbodyaccstdx | FFT of body acceleration x axis signal standard deviation | numeric, average by subject and activity id
fbodyaccstdy | FFT of body acceleration y axis signal standard deviation | numeric, average by subject and activity id	
fbodyaccstdz | FFT of body acceleration z axis signal standard deviation | numeric, average by subject and activity id
fbodyaccjerkmeanx | FFT of body acceleration x axis jerk signal mean | numeric, average by subject and activity id
fbodyaccjerkmeany	| FFT of body acceleration y axis jerk signal mean | numeric, average by subject and activity id
fbodyaccjerkmeanz	| FFT of body acceleration z axis jerk signal mean | numeric, average by subject and activity id
fbodyaccjerkstdx | FFT of body acceleration x axis jerk signal standard deviation | numeric, average by subject and activity id
fbodyaccjerkstdy | FFT of body acceleration y axis jerk signal standard deviation | numeric, average by subject and activity id
fbodyaccjerkstdz | FFT of body acceleration z axis jerk signal standard deviation | numeric, average by subject and activity id
fbodygyromeanx | FFT of body angular velocity x axis signal mean | numeric, average by subject and activity id
fbodygyromeany | FFT of body angular velocity y axis signal mean | numeric, average by subject and activity id
fbodygyromeanz | FFT of body angular velocity z axis signal mean | numeric, average by subject and activity id
fbodygyrostdx | FFT of body angular velocity x axis signal standard deviation | numeric, average by subject and activity id
fbodygyrostdy | FFT of body angular velocity y axis signal standard deviation | numeric, average by subject and activity id
fbodygyrostdz | FFT of body angular velocity z axis signal standard deviation | numeric, average by subject and activity id
fbodyaccmagmean | FFT of body acceleration magnitude mean | numeric, average by subject and activity id
fbodyaccmagstd | FFT of body acceleration magnitude standard deviation | numeric, average by subject and activity id
fbodyaccjerkmagmean | FFT of body acceleration jerk signal magnitude mean | numeric, average by subject and activity id
fbodyaccjerkmagstd | FFT of body acceleration jerk signal magnitude standard deviation | numeric, average by subject and activity id
fbodygyromagmean | FFT of body angular velocity magnitude mean | numeric, average by subject and activity id
fbodygyromagstd | FFT of body angular velocity magnitude standard deviation | numeric, average by subject and activity id
fbodygyrojerkmagmean | FFT of body angular velocity jerk signal magnitude mean | numeric, average by subject and activity id
fbodygyrojerkmagstd | FFT of body angular velocity jerk signal magnitude standard deviation | numeric, average by subject and activity id

For a more information on the meaning of each variable in the context of the original experiment, please refer to the files 'experiment_info.txt' and 'features_info.txt'.

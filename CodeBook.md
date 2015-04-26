Course Project CodeBook: Getting and Cleaning Data 
---------------------------------------------------------------------------

This file will serve as reference on variable name of data and its transformation/process performed on this course project 

>Source:

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

>run_analysis.R:


- Read .txt from the "./data/train" folder and store them as:
```
TrnData - X_train.txt
TrnLabel- y_train.txt
TrnSubject - subject_train.txt
```


- Read .txt from the "./data/test" folder and store them as:
```
TrnData - X_test.txt
TrnLabel- y_test.txt
TrnSubject - subject_test.txt
```


- Rbind (concatenate) Train and Test data as:
```
TstData and TrnData - ConData 
TstLabel and TrnLabel - ConLabel 
TstSubject and TrnSubject - ConSubject 
```

- Read the .txt file from the "/data" folder and store the data as:
```
features.txt - fea
activity_labels.txt - act
```
- Extract the measurements on the mean and standard deviation. This results in a 66 indices list. 
- Get a subset of ConData with the 66 corresponding columns.
- Clean the column names of the subset. Remove the "()" and "-" symbols inthe names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
- Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.
- Transform the values of ConLabel according to the activity data frame.
- Combine the ConSubject, ConLabel and ConData by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
- Write the cleanedData out to "Cleaned_data.txt" file in current working directory.
- Generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
- Write the result out to "data_means.txt" file in current working directory.
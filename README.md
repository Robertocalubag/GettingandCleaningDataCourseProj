Course Project: Getting and Cleaning Data 
------------------------------------------------------

> This is to discuss on what are the script being used in this project and how does it run

- Extract and unzip the data from below link and save to current working directory as "data"
- Go to R console or Rstudio and run source("run_analysis.R")
- The following files will be generated: CleanedData.txt and data_means.txt
- Since we are required to to get the average variables for each activity and each subject ( 6 activity*30 subject), 66 features and 180 rows. To get this, please run data<-read.table("data_means.txt"). I already provided you the result in **data_result.txt** file for reference
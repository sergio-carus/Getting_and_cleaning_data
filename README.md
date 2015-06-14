#Getting and Cleaning Data: Course Project (Coursera)
Sergio Carus, June 13th, 2015

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
  

##Data Source
Data for the project was taken from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Project Summary
The script run_analysis.R does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, 
   independent tidy data set with the average of each variable for each activity and each subject.

   
##Dataset transformation and clean-up

- A new directory was created to store the data (Getting_and_cleaning_data_project).
- Data was downwloaded from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Files were unzipped and the working directory, set.
- All the necessary files were read, using "read.table" function.
- The properties of the data were checked with "str" and "head" functions.
- Training and test data were merged using "rbind"
- An appropriate name was given for each dataset (subject_data, activity_data, features_data)
- Columns were renamed wit a descriptive name (subject, activity and the 561 features from the feature list)
- Data was merged into a single dataset with "cbind", called "df".
- Columns that contained "mean" and "std" in their names were extracted from the dataset, along with
activity and subject. The new dataset was called "df2" 
- Activity names were replaced to be more descriptive, using the activity labels and substituting directly
in the table with  "df2[, 1]<-activity_labels[df2[, 1], 2]"
- Column names were renamed to be more descriptive using "gsub", for instance "f" at the beginning 
of the variable names was substitute by "Frequency", "t" by "Time", "Acc" by "Accelerometer", "Gyro" by
"Gyroscope", "Mag" by "Magnetic". 
- A new dataset called "df3" was created with the "aggregate" function to show the average of each variable
per activity and subject. Then, data was sorted by subject and activity.
- Finally, a table with dataset "df3" was exported in a ".txt" called "final_dataset".   
   
   
##Additional information
Information about the variables description, the data, and any transformations or work 
performed in order to clean up the data can be found in the file called CodeBook.md.   


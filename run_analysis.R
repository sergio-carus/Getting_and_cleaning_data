#Getting and Cleaning Data: Course Project (Coursera)
#Sergio Carus, June 13th, 2015

#run_analysis.R does the following: 
#1.It merges the training and the test sets to create one data set.
#2.It extracts only the measurements on the mean and standard deviation for each measurement. 
#3.It uses descriptive activity names to name the activities in the data set.
#4.It appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, it creates a second, 
#  independent tidy data set with the average of each variable for each activity 
#  and each subject.


#####Step 1#####
#Create directory where data will be stored
if(!file.exists("./Getting_and_cleaning_data_project")){dir.create("./Getting_and_cleaning_data_project")}

#Download the file in the directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Getting_and_cleaning_data_project/Data.zip")

#Unzip  the files
unzip(zipfile="./Getting_and_cleaning_data_project/Data.zip",exdir="./Getting_and_cleaning_data_project/Data")

#Assign the working directory
setwd("C:/Users/TOSHIBA/Documents/Getting_and_cleaning_data_project/Data/UCI HAR Dataset")

#Read the files
activity_labels<-read.table("activity_labels.txt",header = FALSE)
features<-read.table("features.txt",header = FALSE)
subject_test<-read.table("./test/subject_test.txt",header = FALSE)
x_test<-read.table("./test/x_test.txt",header = FALSE)
y_test<-read.table("./test/y_test.txt",header = FALSE)
subject_train<-read.table("./train/subject_train.txt",header = FALSE)
x_train<-read.table("./train/x_train.txt",header = FALSE)
y_train<-read.table("./train/y_train.txt",header = FALSE)

#Merge training and test data
subject_data<-rbind(subject_train,subject_test)
activity_data<-rbind(y_train,y_test)
features_data<-rbind(x_train,x_test)

#Rename columns with descriptive names
names(subject_data)<-"subject"
names(activity_data)<-"activity"
names(features_data)<-features$V2

#Merge all data into a single dataset
df<-cbind(activity_data,subject_data,features_data)

#####Step 2#####
#Extract columns that contain the mean and the stdev for each measurement 
#(and keeping activity and subject columns)
df2<-df[,grep("activity|subject|mean|std|Mean",names(df))]

#####Step 3#####
#Use descriptive activity names to name the activities in the data set
df2[, 1]<-activity_labels[df2[, 1], 2]

#####Step 4#####
#Appropriately labels the data set with descriptive variable names. 
names(df2)<-gsub("^f","Frequency",names(df2))
names(df2)<-gsub("^t","Time",names(df2))
names(df2)<-gsub("Acc","Accelerometer",names(df2))
names(df2)<-gsub("Gyro","Gyroscope",names(df2))
names(df2)<-gsub("Mag","Magnetic",names(df2))
names(df2)<-gsub("\\()","",names(df2))
names(df2)<-gsub("BodyBody","Body",names(df2))
names(df2)<-gsub("tBody","TimeBody",names(df2))


#####Step 5#####
#From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity 
#and each subject.
df3<-aggregate(. ~ activity + subject,df2,mean)
df3<-df3[order(df3$subject,df3$activity),]
write.table(df3, file = "final_dataset.txt",row.name=FALSE)










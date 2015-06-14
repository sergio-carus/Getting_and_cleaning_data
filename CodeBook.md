#Code Book

##Data

An experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING), wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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

##Variable Description

Variables in the table can be found with the following names:

 [1] "activity"                                         
 [2] "subject"                                          
 [3] "TimeBodyAccelerometer-mean-X"                     
 [4] "TimeBodyAccelerometer-mean-Y"                     
 [5] "TimeBodyAccelerometer-mean-Z"                     
 [6] "TimeBodyAccelerometer-std-X"                      
 [7] "TimeBodyAccelerometer-std-Y"                      
 [8] "TimeBodyAccelerometer-std-Z"                      
 [9] "TimeGravityAccelerometer-mean-X"                  
[10] "TimeGravityAccelerometer-mean-Y"                  
[11] "TimeGravityAccelerometer-mean-Z"                  
[12] "TimeGravityAccelerometer-std-X"                   
[13] "TimeGravityAccelerometer-std-Y"                   
[14] "TimeGravityAccelerometer-std-Z"                   
[15] "TimeBodyAccelerometerJerk-mean-X"                 
[16] "TimeBodyAccelerometerJerk-mean-Y"                 
[17] "TimeBodyAccelerometerJerk-mean-Z"                 
[18] "TimeBodyAccelerometerJerk-std-X"                  
[19] "TimeBodyAccelerometerJerk-std-Y"                  
[20] "TimeBodyAccelerometerJerk-std-Z"                  
[21] "TimeBodyGyroscope-mean-X"                         
[22] "TimeBodyGyroscope-mean-Y"                         
[23] "TimeBodyGyroscope-mean-Z"                         
[24] "TimeBodyGyroscope-std-X"                          
[25] "TimeBodyGyroscope-std-Y"                          
[26] "TimeBodyGyroscope-std-Z"                          
[27] "TimeBodyGyroscopeJerk-mean-X"                     
[28] "TimeBodyGyroscopeJerk-mean-Y"                     
[29] "TimeBodyGyroscopeJerk-mean-Z"                     
[30] "TimeBodyGyroscopeJerk-std-X"                      
[31] "TimeBodyGyroscopeJerk-std-Y"                      
[32] "TimeBodyGyroscopeJerk-std-Z"                      
[33] "TimeBodyAccelerometerMagnetic-mean"               
[34] "TimeBodyAccelerometerMagnetic-std"                
[35] "TimeGravityAccelerometerMagnetic-mean"            
[36] "TimeGravityAccelerometerMagnetic-std"             
[37] "TimeBodyAccelerometerJerkMagnetic-mean"           
[38] "TimeBodyAccelerometerJerkMagnetic-std"            
[39] "TimeBodyGyroscopeMagnetic-mean"                   
[40] "TimeBodyGyroscopeMagnetic-std"                    
[41] "TimeBodyGyroscopeJerkMagnetic-mean"               
[42] "TimeBodyGyroscopeJerkMagnetic-std"                
[43] "FrequencyBodyAccelerometer-mean-X"                
[44] "FrequencyBodyAccelerometer-mean-Y"                
[45] "FrequencyBodyAccelerometer-mean-Z"                
[46] "FrequencyBodyAccelerometer-std-X"                 
[47] "FrequencyBodyAccelerometer-std-Y"                 
[48] "FrequencyBodyAccelerometer-std-Z"                 
[49] "FrequencyBodyAccelerometer-meanFreq-X"            
[50] "FrequencyBodyAccelerometer-meanFreq-Y"            
[51] "FrequencyBodyAccelerometer-meanFreq-Z"            
[52] "FrequencyBodyAccelerometerJerk-mean-X"            
[53] "FrequencyBodyAccelerometerJerk-mean-Y"            
[54] "FrequencyBodyAccelerometerJerk-mean-Z"            
[55] "FrequencyBodyAccelerometerJerk-std-X"             
[56] "FrequencyBodyAccelerometerJerk-std-Y"             
[57] "FrequencyBodyAccelerometerJerk-std-Z"             
[58] "FrequencyBodyAccelerometerJerk-meanFreq-X"        
[59] "FrequencyBodyAccelerometerJerk-meanFreq-Y"        
[60] "FrequencyBodyAccelerometerJerk-meanFreq-Z"        
[61] "FrequencyBodyGyroscope-mean-X"                    
[62] "FrequencyBodyGyroscope-mean-Y"                    
[63] "FrequencyBodyGyroscope-mean-Z"                    
[64] "FrequencyBodyGyroscope-std-X"                     
[65] "FrequencyBodyGyroscope-std-Y"                     
[66] "FrequencyBodyGyroscope-std-Z"                     
[67] "FrequencyBodyGyroscope-meanFreq-X"                
[68] "FrequencyBodyGyroscope-meanFreq-Y"                
[69] "FrequencyBodyGyroscope-meanFreq-Z"                
[70] "FrequencyBodyAccelerometerMagnetic-mean"          
[71] "FrequencyBodyAccelerometerMagnetic-std"           
[72] "FrequencyBodyAccelerometerMagnetic-meanFreq"      
[73] "FrequencyBodyAccelerometerJerkMagnetic-mean"      
[74] "FrequencyBodyAccelerometerJerkMagnetic-std"       
[75] "FrequencyBodyAccelerometerJerkMagnetic-meanFreq"  
[76] "FrequencyBodyGyroscopeMagnetic-mean"              
[77] "FrequencyBodyGyroscopeMagnetic-std"               
[78] "FrequencyBodyGyroscopeMagnetic-meanFreq"          
[79] "FrequencyBodyGyroscopeJerkMagnetic-mean"          
[80] "FrequencyBodyGyroscopeJerkMagnetic-std"           
[81] "FrequencyBodyGyroscopeJerkMagnetic-meanFreq"      
[82] "angle(TimeBodyAccelerometerMean,gravity)"         
[83] "angle(TimeBodyAccelerometerJerkMean),gravityMean)"
[84] "angle(TimeBodyGyroscopeMean,gravityMean)"         
[85] "angle(TimeBodyGyroscopeJerkMean,gravityMean)"     
[86] "angle(X,gravityMean)"                             
[87] "angle(Y,gravityMean)"                             
[88] "angle(Z,gravityMean)"

 
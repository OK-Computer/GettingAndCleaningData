#STEP 1: Merge the training and the test sets to create one data set.

##STEP 1(a): Read the training set
train<-read.csv("train\\X_train.txt",sep="",header=FALSE)

##STEP 1(b): Read the test set 
test<-read.csv("test\\X_test.txt",sep="",header=FALSE)

##STEP 1(c): Read the features set and convert to a form that can be used as
##the column header for the merged training and test data set
features_file<-read.csv("features.txt",sep="",header=FALSE)
features_names<-features_file$V2
features_names<-gsub('-mean','Mean',features_names)
features_names<-gsub('-std','Std',features_names)
features_names<-gsub('[-()]','',features_names)

##STEP 1(d): Combine features, training and test sets
combined_dataset<-rbind(train,test)
names(combined_dataset)<-features_names

#STEP 2: Extract only the measurements on the mean and standard deviation
#for each measurement.

mean_std_dataset<-combined_dataset[,c(grep("Mean",colnames(combined_dataset)),grep("Std",colnames(combined_dataset)))]

#STEP 3: Use descriptive activity names to name the activities in the data set.

##STEP 3(a): List the activity labels
activity_labels<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

##STEP 3(b): Read the training and test activity labels (numbers)
training_labels<-read.csv("train\\y_train.txt",sep="",header=FALSE)
test_labels<-read.csv("test\\y_test.txt",sep="",header=FALSE)

##STEP 3(c): Combine the training and test activity labels (numbers)
combined_labels<-rbind(training_labels,test_labels)

##STEP 3(d): Replace the training and test labels (numbers)
##with activity labels (names)
replaced_labels<-data.frame()
for(i in 1:10299){
  replaced_labels[i,1]<-activity_labels[combined_labels[i,1]]
}
names(replaced_labels)<-"Activity"

#STEP 4: Appropriately label the data set with descriptive variable names.
mean_std_dataset<-cbind(mean_std_dataset,replaced_labels)

#STEP 5: From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each 
#subject.

##STEP 5(a): Read the training and test subject labels
training_subject_labels<-read.csv("train\\subject_train.txt",sep="",header=FALSE)
test_subject_labels<-read.csv("test\\subject_test.txt",sep="",header=FALSE)

##STEP 5(b): Combine the training and test subject labels
combined_subject_labels<-rbind(training_subject_labels,test_subject_labels)
names(combined_subject_labels)<-"Subject"

##STEP 5(c): Combine the subject labels into the mean_std_dataset
mean_std_dataset<-cbind(mean_std_dataset,combined_subject_labels)

##STEP 5(d): Find the average of each variable for each activity and each
##subject to form the tidy dataset (using the "aggregate" function)
mean_std_dataset$Activity<-as.numeric(mean_std_dataset$Activity)
mean_std_dataset$Subject<-as.numeric(mean_std_dataset$Subject)
tidy<-aggregate(mean_std_dataset, by=list(Activity=mean_std_dataset$Activity,Subject=mean_std_dataset$Subject),mean, na.rm=TRUE)
write.table(tidy, "tidy.txt", sep="")



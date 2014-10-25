
#Code Book for the Getting and Cleaning Data Project

##Data Source

The data was taken the "Human Activity Recognition" database from a study carried out by Reyes-Ortiz, Anguita, Ghio and Oneto from Smartlab - Non Linear Complex Systems Laboratory at DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy. The database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors

The database can be found here:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The assumption here is that the peer reviewer would have downloaded the database, and have access to the README and features_info files, and the peer reviewer should refer to these for information about the variables from the original dataset.

This Code Book will focus on the variables used in the run_analysis.R script submitted as part of the project.

##Variables from the run_analysis.R script

####activity_labels: 
the 6 activity labels from the original data set (i.e. "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

####combined_dataset: 
combines the *test* and *train* datasets

####combined_labels: 
combined activity labels from the *test_labels* and *training_labels* datasets

####combined_subject_labels: 
combined subject labels from the *test_subject_labels* and *training_subject_labels* datasets

####features_file: 
the features set from file "features.txt"

####features_names: 
the transformed features set, derived from *features_file*

####mean_std_dataset: 
the filtered dataset that only includes variables related to mean and standard deviation

####replaced_labels: 
an intermediate dataset, transforming the numeric activity labels corresponding to the various rows / subjects into the activity labels in words

####test: 
the test set from file "X_test.txt"

####test_labels: 
numbers corresponding to the 6 activities described in words in *activity_labels* for the test set

####test_subject_labels: 
numbers (1-30) corresponding to the subjects in the test set

####tidy: 
the tidy data set required in Step 5 of the project

####train: 
the training set from file "X_train.txt"

####training_labels: 
numbers corresponding to the 6 activities described in words in *activity_labels* for the training set

####training_subject_labels: numbers (1-30) corresponding to the subjects in the training set









#README FOR THE GETTING AND CLEANING DATA PROJECT

##PRELIMINARY COMMENTS AND ASSUMPTIONS

The R script used for this project used the standard R package. No additional packages (e.g. plyr, replace) need to be downloaded.

The assumptions here are that:
* the user running the R script has downloaded the UCI HAR Dataset; and
* the user has set her working directory to the folder where the UCI HAR Dataset was extracted, and which contains the folders ("test", "train") and the files ("activity_labels", "features", "features_info", "README").

To access the "tidy.txt" file, please download the tidy.txt file into the same working directory as above and use the command *"data <- read.csv("tidy.txt", header = TRUE)"* followed by *"view(data)"*.

##STEP 1: Merge the training and the test sets to create one data set.

The script achieves this by taking the following steps, described in the comments in the script. [Further explanations here are given in the square brackets]:

* STEP 1(a): Read the training set. [The file named "X_train.txt". The script uses the *"read.csv"* command for this and other read actions.]
* STEP 1(b): Read the test set. [The file named "X_test.txt".]
* STEP 1(c): Read the features set and convert to a form that can be used as the column header for the merged training and test data set. [This step is not strictly necessarily based on the project instructions, but serves to make the headers of the tidy file look neater.]
* STEP 1(d): Combine features, training and test sets. [Using the "rbind" command, forming an intermediate data frame named 'combined_dataset'. The second command, *"names(command_dataset)<-features_names",* is used to provide column headings.]
* Therefore, at the end of Step 1(d), *'combined_dataset'* is the required output of merging the training and test sets to create one data set.

##STEP 2: Extract only the measurements on the mean and standard deviation for each measurement.

* The assumption made in this step is that "measurements on the mean and standard deviation for each measurement" refers to any column variable (i.e. from the "features.txt" file from the UCI HAR Dataset) which contains the words "mean" or "std".
* Extraction is carried out using the *"grep"* command, extracting data with column containing "Mean" or "Std" (refer to Step 1(c) above, where the column headers were transformed), into a data frame *"mean_std_dataset"*.

##STEP 3: Use descriptive activity names to name the activities in the data set.

The assumption made in this step is that "descriptive activity names" are those contained in the "activity_labels.txt" files, and the requirement of this step is to replace the numeric labels contained in the training and test activity labels files ("y_training.txt" and "y_test.txt" respectively) with descriptive activity names from the "activity_labels.txt" file.

* STEP 3(a): List the activity labels.
* STEP 3(b): Read the training and test activity labels (numbers).
* STEP 3(c): Combine the training and test activity labels (numbers). [Steps 3(b) and 3(c) are similar to Steps 1(a) to (d) above.]
* STEP 3(d): Replace the training and test labels (numbers) with activity labels (names). [Uses a for-loop, starting with an empty data frame *"replaced_labels"* and then cycling through the *"combined_labels"* data set from Step 3(c) and assigning to the *"replaced_labels"* data set (by creating a new row i.e. i) the descriptive activity name corresponding to the relevant activity label (number) in the relevant row (i.e. at that point i in the for loop) of the *"combined_labels"* data set.]

##STEP 4: Appropriately label the data set with descriptive variable names.

The result of the transformation in Step 3 (i.e. the *"replaced_labels"* data frame) is combined with the *"mean_std_dataset"* data frame using the *"cbind"* command.

##STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* STEP 5(a): Read the training and test subject labels. 
* STEP 5(b): Combine the training and test subject labels.
* STEP 5(c): Combine the subject labels into the mean_std_dataset. [Steps 5(a) to 5(c) were taken because the requirement in this Step 5 is to average for subject as well as activity. Step 4 had produced the data set *"mean_std_dataset"* which included activity labels, but had not yet included subject labels.]
* STEP 5(d): Find the average of each variable for each activity and each subject to form the tidy dataset (using the "aggregate" function). [I used the *"aggregate"* function, as opposed to a command taken from the plyr or reshape2 packages for compatibility purposes for peer review, so peer reviewers would not need to install those packages. However, one issue I encountered was that, when I tried using the *"aggregate"* command without transforming the "Activity" and "Subject" vectors into numbers, I received an error message "argument is not numeric or logical: returning NA". The only way that I could think of to resolve this issue was to convert the "Activity" and "Subject" vector into numbers, which were accomplished by lines 66 and 67 of the script.



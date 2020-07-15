# Course-Project-Tidy-Data-Set

Explanation of R Code

1. All features & activities are converted to a character vector. (1 for each)
2. TRAIN tidy data set (ftrain) is created with all subject names, activity names and variable names.
3. TEST tidy data set (ftest) is created with all subject names, activity names and variable names.
4. Both data sets are merged to get 1 combined tidy data set. (merged)
5. Only the measurements on the mean and standard deviation are extracted from merged data set.
   Meaning only variables/COLUMNS associated with measuring mean and standard deviation are selected.
   This is known as extracted data set.
6. All the columns are converted to numeric type.
7. Then that data set is splitted 2 times to obtain sets for each subject and each activity separately.
8. The mean for each variable is calculated in loop for every data set.
9. 30 subjects and 6 activities give 180 readings for all variables.
10. The final tidy data set is called avg which is outputted at last.

LIBRARIES : dplyr, stringr
VARIABLES :
1. activity1 - chr [1:6] - contains all activity names
2. i - numeric - A variable used for looping
3. n - logi [1:668] - contains only good cases or good values from train and test text files
4. p - chr - "Average of" - to name varibales of final tidy data set
5. y_test1 - int [1:2947] - to get all values of test labels (1 to 6) as a vector
6. y_train1 - int [1:7352] - to get all values of train labels (1 to 6) as a vector
7. y1 - Named num [1:66] - a vector to store mean values of all variables each time during loop
8. ext - chr [1:66] - contains names of all variables of final data set
DATA :
~ The variables - features, activity, t1, t2, y_train, y_test are used to read files from given data folder
1. train - 7352 obs. of 561 variables
   initial train data set with train data
2. test - 2947 obs. of 561 variables
   initial test data set with test data
3. ftrain - 7352 obs. of 563 variables
   final tidy train data set
4. ftest - 2947 obs. of 563 variables
   final tidy test data set
5. m - large matrix
   a matrix which is then used to convert to an empty data frame
6. sub_train - 7352 obs. of 1 variable
   subjects used in train data - 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30
7. sub_test - 2947 obs. of 1 variable
   subjects used in test data - 2,4,9,10,12,13,18,20,24
8. merged - 10299 obs. of 563 variables
   the ftrain and ftest data sets are merged
9. extracted - 10299 obs. of 68 variables
   contains the required mean and standard deviation variables extracted from merged data set
10. avg - 180 obs. of 68 variables
    the required final tidy data set containing the mean values for each variable of all the subjects and activities separately

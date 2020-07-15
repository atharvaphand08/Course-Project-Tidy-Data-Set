library(dplyr)
library(stringr)

features <- read.delim("features.txt",header = FALSE)
activity <- read.delim("activity_labels.txt",header = FALSE)
activity1 <- activity[,1]
sub_test <- read.delim("test\\subject_test.txt",header = FALSE)
sub_train <- read.delim("train\\subject_train.txt",header = FALSE)

t1 <- read.delim("train\\X_train.txt",header = FALSE, sep = "\t", dec = ".")
m <- matrix(nrow = 7352,ncol=561)
i <- 1
while(i <= 7352){
  a <- t1[i,]
  a <- strsplit(a," ")
  a <- as.character(a[[1]])
  n <- !a %in% ""
  a <- a[n]
  class(a) = "numeric"
  m[i,] = a
  i <- i + 1
}
train <- as.data.frame(m)

y_train <- read.delim("train\\y_train.txt",header = FALSE)
y_train1 <- y_train[,1]
i <- 1
m <- matrix(nrow = 7352,ncol=561)
m <- as.data.frame(m)
for(x in y_train1) {
  m[i,1] <- activity1[x]
  i <- i + 1
}

ftrain <- mutate(train, Activity = m[,1], Subject = sub_train[,1])
ftrain <- select(ftrain, Subject, Activity,1:561)
colnames(ftrain)[3:563] <- features[,1]


t2 <- read.delim("test\\X_test.txt",header = FALSE, sep = "\t", dec = ".")
m <- matrix(nrow = 2947,ncol=561)
i <- 1
while(i <= 2947){
  a <- t2[i,]
  a <- strsplit(a," ")
  a <- as.character(a[[1]])
  n <- !a %in% ""
  a <- a[n]
  class(a) = "numeric"
  m[i,] = a
  i <- i + 1
}
test <- as.data.frame(m)

y_test <- read.delim("test\\y_test.txt",header = FALSE)
y_test1 <- y_test[,1]
i <- 1
m <- matrix(nrow = 2947,ncol=561)
for(x in y_test1) {
  m[i,1] <- activity1[x]
  i <- i + 1
}

ftest <- mutate(test, Activity = m[,1], Subject = sub_test[,1])
ftest <- select(ftest, Subject, Activity,1:561)
colnames(ftest)[3:563] <- features[,1]

merged <- merge(ftrain,ftest,all = TRUE)

ext <- str_extract(colnames(merged),regex("(.*)mean\\(\\)(.*)|(.*)std\\(\\)(.*)",ignore_case = T))
ext <- ext[!is.na(ext)]
m <- matrix(nrow = 10299,ncol = (length(ext) + 2))
m[,1] <- merged[,1]
m[,2] <- merged[,2]
i <- 3
for(x in ext){
  m[,i] <- merged[,x]
  i <- i + 1
}
extracted <- as.data.frame(m)
colnames(extracted)[1:2] <- colnames(merged)[1:2]
colnames(extracted)[3:ncol(extracted)] <- ext

class(extracted$Subject) = "numeric"
i <- 3
while(i < 69) {
  class(extracted[,i]) = "numeric"
  i <- i + 1
}
extracted <- arrange(extracted,Subject)

l <- split(extracted,extracted$Subject)
i <- 1
avg <- matrix(nrow = 180,ncol = 66)
avg <- as.data.frame(avg)
for (x in l) {
  ll <- split(x, x$Activity)
  for(y in ll){
    y <- select(y,-(Subject:Activity))
    y1 <- colMeans(y)
    avg[i,] <- y1
    i <- i + 1
  }
}
p <- "Average of "
i <- 1
while(i < 67) {
  ext[i] <- paste(p,ext[i],sep = "")
  i <- i + 1
}
colnames(avg) <- ext
avg <- mutate(avg, Subject = rep(1:30,each = 6))
avg <- mutate(avg, Activity = rep(activity1,30))
avg <- select(avg, Subject, Activity, 1:66)

View(avg)
##read each txt file into R as its own variable
setwd("./data/")
x_train <- read.delim("./UCI HAR Dataset/train/X_train.txt", header = F)
y_train <- read.delim("./UCI HAR Dataset/train/y_train.txt", header = F)
x_test <- read.delim("./UCI HAR Dataset/test/X_test.txt", header = F)
y_test <- read.delim("./UCI HAR Dataset/test/y_test.txt", header = F)
subj_test <- read.delim("./UCI HAR Dataset/test/subject_test.txt", header = F)
subj_train <- read.delim("./UCI HAR Dataset/train/subject_train.txt", header = F)

##column bind the two variables for each test and train, then row bind 
##both of those tables together
##add column names
train <- cbind(x_train, y_train, subj_train)
test <- cbind(x_test, y_test, subj_test)
merged <- rbind(train, test)
colnames <- c("observation", "activity", "subject")
names(merged) <- colnames

##the merged data has some spaces before every observation, lets remove these
num <- nrow(merged)
library(stringr)
for (i in 1:num) {
  merged[i,1] <- str_replace(merged[i,1], "  ", "")
}

setwd('..')
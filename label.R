##now lets assign some real labels to the variable names in df
##and we can also replace the numeric values in activity to their
##corresponding description

colnames(df)[67] <- "activity"
colnames(df)[68] <- "subject"

##read the activities file into R
setwd("./data/")
activities <- read.delim("./UCI HAR Dataset/activity_labels.txt", 
                       header = F)
##split the character strings in activities by the space between the integer and
##the corresponding activity description
pat <- "[1-6] "
clean_act <- sapply(activities, sub, pattern = pat, replacement = "")

##create a for loop to replace the activity integers with the descriptions
num <- nrow(df)
for (i in 1:num) {
    val <- df$activity[i]
    desc <- clean_act[as.numeric(val)]
    df$activity[i] <- desc
}

setwd('..')

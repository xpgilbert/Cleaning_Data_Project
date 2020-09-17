##create a list of variable names by reading features.txt into R
setwd("./data/")
features <- read.delim("./UCI HAR Dataset/features.txt", 
                       header = F)
##clean up the names since they have numbers at the beginning, which we
##wont need in the final table
pat <- "[1-561] "
clean_names <- sapply(features, sub, pattern = pat, replacement = "")

##make a character vector for the pattern argument in grep()
##store the result of grep as an integer vector called index
meanstd <- ".*mean\\(.*|.*std\\(.*"
index <- grep(meanstd, clean_names)


##create a new character vector with the variable names we are interested in
index_names <- clean_names[index]

setwd('..')
##create a list of variable names by reading features.txt into R
setwd("./data/")
features <- read.delim("./UCI HAR Dataset/features.txt", 
                       header = F)

##clean up the names since they have numbers at the beginning, which we
##wont need in the final table
##num <- length(index_names)
##pat <- paste0("[0:", num, " ]")
##clean_names <- sapply(features, sub, pattern = pat, replacement = "")

##create an empty data frame with dimensions 0, length(index_names)
##assign the column names to be the clean_names
df <- data.frame(matrix(nrow=0, ncol = num))
colnames(df) <- index_names

setwd('..')
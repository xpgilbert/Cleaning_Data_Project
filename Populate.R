##extract the elements of the merged data frame and assign the value
##to the correct cell in the empty data frame df
library(stringr)
num <- nrow(merged)
##create an empty list l to store the lists produced by str_extract_all
l <- list()
for (i in 1:num) {
  obs <- merged$observation[i]
  ele_list <- list()
  ##a for loop with the word function is an easy way to extract elements
  ##using the index from index.R and then we store them in a list ele_list
  o <- 1 ##counter for the for loop
  for (t in index) {
    ele <- c()
    ele <- word(obs, t)
    ele_list[[o]] <- as.numeric(ele)
    o <- o + 1}
  l[[i]] <- ele_list
  }
##now we have a list of lists, where each element of the list l is a list of
##79 elements each corresponding to one observation in the merged data frame
##we will use this list l to populate the data into the df data frame

##list l has some NA's, these need to be removed
##l <- lapply(l, function(x) x[!is.na(x)])

for (i in 1:num) {
  row <- c()
  row <- as.data.frame(l[[i]])
  colnames(row) <- index_names
  df <- rbind(df, row)
}

##now we need to column bind the activities and subjects to df
df <- cbind(df, merged$activity, merged$subject)

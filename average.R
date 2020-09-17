##using the aggregate function we can easily see the means of all variables
##by subject and by activity

##aggregate takes a dataframe, a list, and a functino as its arguments
##the list here is both subject and activity columns, so we create a list with
##both of those and then pass it through aggregate

agg_list <- list(df$activity, df$subject)
average_df <- aggregate(df, agg_list, FUN = mean, na.rm = T)

##we dont need the last two columns of this resulting data frame
##so lets remove them

average_df$activity <- NULL
average_df$subject <- NULL

##lets label the two first columns of the resulting data frame

colnames(average_df)[1] <- "actvity"
colnames(average_df)[2] <- "subject"
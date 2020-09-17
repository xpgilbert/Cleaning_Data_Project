##now lets write the resulting data frame into a txt file
##called "average_data.txt"
write.table(average_df, "average_data.txt", row.names = F)
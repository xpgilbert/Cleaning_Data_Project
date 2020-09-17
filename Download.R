if(!file.exists("./data/")) {dir.create("./data/")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipName <- "project_data.zip"
zip_path <- paste0("./data/", zipName)
download.file(fileURL, destfile = zip_path, merged="curl")
unzip(zip_path, exdir = "./data")
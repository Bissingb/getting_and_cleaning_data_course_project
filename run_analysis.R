##Downlaod and process the data.  Note that the folder created from the tempfile
##will be named "UCI HAR Dataset" in your wd. 
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
temp <- tempfile()
download.file(fileurl,temp)
unzip(temp)
unlink(temp)

##Read each of the relevant files using read.table, assign the column labels to the 
##associated data, and merge them. 
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
Y_Test  <- read.table("UCI HAR Dataset/test/Y_test.txt")
Y_Train <- read.table("UCI HAR Dataset/train/Y_train.txt")
X_Test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_Train <- read.table("UCI HAR Dataset/train/X_train.txt")
Features <- read.table("UCI HAR Dataset/features.txt")
Subject <- rbind(SubjectTrain, SubjectTest)
Labels <- rbind(Y_Test, Y_Train)
Sets <- rbind(X_Test, X_Train)
names(Subject) <- "subject"
names(Labels) <- "activity"
names(Sets) <- Features$V2
Data <- cbind(Sets, Subject, Labels)

##Extract data that includes only means and stds by using the grep function
##and then regenerating our overall data set with the desired columns.   
MeansandStds <- grep("mean\\(\\)|std\\(\\)", names(Sets))
Sets <- Sets[MeansandStds]
Data <- cbind(Sets, Subject, Labels)

##Read the activity lables and assign the activity names to the data set based on
##on the activity value. 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])

##Rename the columns so that each is descriptive.  Namely, t = time, f = frequency, Acc = Accelerator, 
##Gyro = Gyroscope and Mag = Magnitude.  See the features.info file for more information.
names(Data) <- gsub("Acc", "Accelerator", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))

##Create a tidy data set by turning the data set into a data table (first make sure to 
##install the data.table package), and apply the mean by subject and activity.
DataTable <- data.table(Data)
NewData <- DataTable[, lapply(.SD, mean), by = 'subject,activity']
write.table(NewData, file = "Tidydata.txt", row.names = FALSE)

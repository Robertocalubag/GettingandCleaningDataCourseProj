# A. Create data set.
TrnData <- read.table("./data/train/X_train.txt")
TrnLabel <- read.table("./data/train/y_train.txt")
TrnSubject <- read.table("./data/train/subject_train.txt")
TstData <- read.table("./data/test/X_test.txt")
TstLabel <- read.table("./data/test/y_test.txt") 
TstSubject <- read.table("./data/test/subject_test.txt")
Fea <- read.table("./data/features.txt")
Act <- read.table("./data/activity_labels.txt")

# B. Rbind/Concatenate Train and Test 
ConData <- rbind(TrnData, TstData)
ConLabel <- rbind(TrnLabel, TstLabel)
ConSubject <- rbind(TrnSubject, TstSubject)

# C. Getting the mean ang standard deviation for each measurement
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", Fea [, 2])
length(meanStdIndices)
ConData<-ConData[,meanStdIndices]
names(ConData) <- gsub("\\(\\)", "", Fea [meanStdIndices, 2])
names(ConData) <- gsub("mean", "Mean", names(ConData))
names(ConData) <- gsub("std", "Std", names(ConData))
names(ConData) <- gsub("-", "", names(ConData))

# D. Naming activity in data set and appropriately label
Act[, 2] <- tolower(gsub("_", "", Act[, 2]))
substr(Act[2, 2], 8, 8) <- toupper(substr(Act[2, 2], 8, 8))
substr(Act[3, 2], 8, 8) <- toupper(substr(Act[3, 2], 8, 8))
ActLabel <- Act[ConLabel[, 1], 2]
ConLabel[, 1] <- ActLabel
names(ConLabel) <- "activity"
names(ConSubject) <- "subject"
cleanedData <- cbind(ConSubject, ConLabel, ConData)
write.table(cleanedData, "Cleaned_data.txt")

# E. Data means - data set with average of each variable for each activity and subject
subjectLen <- length(table(ConSubject))
activityLen <- dim(Act)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen){
	for(j in 1:activityLen){
		result[row, 1] <- sort(unique(ConSubject)[, 1])[i]
		result[row, 2] <- Act[j, 2]
		bool1 <- i == cleanedData$subject
		bool2 <- Act[j, 2] == cleanedData$Act
		result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
		row <- row + 1
	}
}
head(result)
write.table(result, "data_means.txt")
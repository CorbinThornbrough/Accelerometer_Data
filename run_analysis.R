#read all inputs
features<-read.table("UCI HAR Dataset/features.txt")
activities<-read.table("UCI HAR Dataset/activity_labels.txt",
                       col.names=c("act","activity"))
test<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-scan("UCI HAR Dataset/test/y_test.txt")
stest<-scan("UCI HAR Dataset/test/subject_test.txt")
train<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-scan("UCI HAR Dataset/train/y_train.txt")
strain<-scan("UCI HAR Dataset/train/subject_train.txt")

#rename columns from features
colnames(test)<-features[,2]
colnames(train)<-features[,2]

#make activity and subject variables
test$act<-ytest
test$sub<-stest
train$act<-ytrain
train$sub<-strain

#combine test and train
complete<-rbind(test,train)
complete<-merge(activities,complete,by.complete="act",by.activities="act")
complete<-complete[,c(2,564,3:563)]

#extract only mean and standard deviations for each measure
mean_std<-complete[ ,grep("mean|std|act|sub",colnames(complete))]
final1<-mean_std[ ,-grep("meanFreq",colnames(mean_std))]

#create data set with mean of each variable for each activity and subject
clean1<-complete[1:2]
clean2<-complete[3:563]
clean2<-data.frame(lapply(clean2,as.numeric))
clean<-cbind(clean1,clean2)
final2<-aggregate(clean[,3:563], by=list(clean$activity,clean$sub),FUN=mean,na.rm=TRUE)
colnames(final2)[1:2]<-c("activity", "subject")

#write tidy data set to csv
write.table(final2,"tidy_data.txt", sep="\t", row.names=FALSE)

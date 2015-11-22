run_analysis <- function(){

    library(data.table)

    #Put activity labels and feature names into vectors
    ykey <- data.table(read.table("activity_labels.txt"))
    names(ykey) <- c("activity_key","activity_name")
    features <- data.table(read.table("features.txt"))

    #Read test and training data
    xtest<-data.table(read.table("test/X_test.txt"))
    names(xtest)<-as.character(features[[2]])
    xtrain<-data.table(read.table("train/X_train.txt"))
    names(xtrain)<-as.character(features[[2]])

    #Subset only mean and Std columns from the data set
    index<-c(grep("-mean()",names(xtest)),grep("-std()",names(xtest)))
    xtest<-xtest[,.SD,.SDcols = index]
    index<-c(grep("-mean()",names(xtrain)),grep("-std()",names(xtrain)))
    xtrain<-xtrain[,.SD,.SDcols = index]

    #Add subject data
    subject<-read.table("test/subject_test.txt")
    xtest<-cbind(xtest,subject)
    setnames(xtest,"V1","subject")
    subject<-read.table("train/subject_train.txt")
    xtrain<-cbind(xtrain,subject)
    setnames(xtrain,"V1","subject")

    #Add activity data
    y<-read.table("test/y_test.txt")
    names(y)<-"activity_key"
    xtest<-cbind(xtest,y)
    xtest<-merge(xtest,ykey,by.x="activity_key",by.y="activity_key")
    y<-read.table("train/y_train.txt")
    names(y)<-"activity_key"
    xtrain<-cbind(xtrain,y)
    xtrain<-merge(xtrain,ykey,by.x="activity_key",by.y="activity_key")

    #Combine tables and reorder columns
    master<-rbind(xtest,xtrain)
    setcolorder(master,c(81,1,82,2:80))

    #Returns a tables of means by subject and activity name
    master[,lapply(.SD,mean),by = "subject,activity_name",.SDcols=4:82][order(subject)]
}
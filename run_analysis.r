merge.UCI.HAR<-function(){
	actLabels<<-NULL
	features<<-NULL
	
	test.df<-read.UCI.HAR("test")
	train.df<-read.UCI.HAR("train")
	
	total.df<-rbind(test.df, train.df)
	colNames<-getMeanOrStdCols()
	total.df<-total.df[,c("activity", "subjectN",colNames)]	
}

read.UCI.HAR<-function(testOrTrain){
	subjectFilePath<-paste0("UCI HAR Dataset/",testOrTrain,"/subject_",testOrTrain,".txt")
	XFilePath<-paste0("UCI HAR Dataset/",testOrTrain,"/X_",testOrTrain,".txt")
	YFilePath<-paste0("UCI HAR Dataset/",testOrTrain,"/Y_",testOrTrain,".txt")
	actLabelsFilePath<<-"UCI HAR Dataset/activity_labels.txt"
	featuresFilePath<<-"UCI HAR Dataset/features.txt"
	subject<-read.table(subjectFilePath)
	X<-read.table(XFilePath)
	Y<-read.table(YFilePath)
	if (is.null(actLabels)) {
		actLabels<<-read.table(actLabelsFilePath)	
	}
	if (is.null(features)) {
		features<<-read.table(featuresFilePath)
		features<<-as.character(levels(features$V2)[features$V2])
	}	

	resFrame<-cbind(Y[,1],subject[,1], X)	
	names(resFrame)<-c("activity","subjectN",features)
	resFrame$activity<-as.factor(resFrame$activity)
	levels(resFrame$activity)<-levels(actLabels$V2)
	resFrame
}

getMeanOrStdCols<-function() {
	featuresFilePath<<-"UCI HAR Dataset/features.txt"
	if (is.null(features)) {
		features<<-read.table(featuresFilePath)
	}
	colNames<-features[unique(c(grep("std", features), grep("mean", features)))]
}

getDFofMeans<-function(total.df) {	
	resMeanFrame<-aggregate(total.df[,-(1:2)],total.df[,1:2],mean)
}
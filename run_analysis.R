#########################################################################################
# R script for the Week 4 assignment of the Coursera course 'Getting & Cleaning Data'   #
#########################################################################################


#### 1. install and load packages ####
if (!("package:dplyr" %in% search())){
  if (! "dplyr" %in% rownames(installed.packages())){
    install.packages("dplyr")
    }
  library(dplyr)
}

#### 2. download zipfile ####
if(!file.exists("assignment_data")) { dir.create("assignment_data")}
fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-tempfile()
download.file(url=fileUrl, destfile=temp, method="curl")

#### 3. list filenames and unzip all files ####
filenames<-unzip(temp, list = TRUE)
unzip(temp, list = FALSE, overwrite = TRUE, 
      unzip = "internal", exdir="./assignment_data", setTimes = TRUE)
unlink(temp)

#### 4. read in and combine the individual tables X_test and X_train ####
X_test<-read.table(file="./assignment_data/UCI HAR Dataset/test/X_test.txt",
                   header=FALSE)
X_train<-read.table(file="./assignment_data/UCI HAR Dataset/train/X_train.txt",
                   header=FALSE)
X<-rbind(X_test,X_train)
rm(X_test,X_train)

#### 5. select only the features containing 'mean()' or 'std()' ####
features<-read.table(file="./assignment_data/UCI HAR Dataset/features.txt",
                    header=FALSE,col.names=c("feature_id","feature"),colClasses=c("numeric","character"))
temp<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)",features$feature)
tempnames<-grep("[Mm]ean\\(\\)|[Ss]td\\(\\)",features$feature,value=T)
X_sel<-select(X,temp)
#assign feature/measurement names
names(X_sel)<-tempnames
  
#### 6. read in and combine the tables y_test and y_train ####
#### .... containing the activity id corresponding to each row in X ####
y_test<-read.table(file="./assignment_data/UCI HAR Dataset/test/y_test.txt",
                   header=FALSE, col.names="activity_id")
y_train<-read.table(file="./assignment_data/UCI HAR Dataset/train/y_train.txt",
                   header=FALSE, col.names="activity_id")
y<-rbind(y_test,y_train)
rm(y_test,y_train)

#### 7. read in and combine tables subject_test and subject_train ####
#### .... containing he subject id corresponding to each row in X ####
subject_test<-read.table(file="./assignment_data/UCI HAR Dataset/test/subject_test.txt",
                   header=FALSE, col.names="subject")
subject_train<-read.table(file="./assignment_data/UCI HAR Dataset/train/subject_train.txt",
                         header=FALSE, col.names="subject")
subject<-rbind(subject_test,subject_train)
rm(subject_test,subject_train)

#### 8. combine all tables into one dataframe 'all' ####
all<-cbind(subject,y,X_sel)

#### 9. assign activity names ####
activity_labels<-read.table(file="./assignment_data/UCI HAR Dataset/activity_labels.txt",
                            header=FALSE, col.names=c("activity_id","activity"))
all<-merge(all,activity_labels,by="activity_id")


#### 10. create tidy dataset ####
#### .... with mean of each measurement by subject & activity ####

tidy_wide <- all %>%
        group_by(subject,activity) %>%
        summarise_each(funs(mean(., na.rm=TRUE)), -activity_id) %>%
        arrange(subject, activity) 

#### 11. tidy up the variable names ####
# all lower case, remove "()" and "-",substitute 'bodybody' with 'body'
names(tidy_wide)<-sub("bodybody","body",gsub("-","",sub("\\(\\)","",tolower(names(tidy_wide)))))
temp1<-names(tidy_wide)
#### 12. write table to 'tidy_wide.txt' ####
write.table(tidy_wide,file="tidy_wide.txt")

##### For peer review: ####
##code to read-in the tidy dataset:
#tidy_wide<-read.table(file="tidy_wide.txt", header=TRUE, sep="")

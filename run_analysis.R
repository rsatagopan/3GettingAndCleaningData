## 3. Getting and Cleaning Data
## course project
## run_analysis.R

print("loading required packages...")
install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)

run_analysis <- function()
{
## ======================= for test data ====================================
## need 3 files - subject.txt (subjects of the test), y.txt (attribute types), X.txt (observations)
## all these files have the same number of rows - we will merge them later to get the complete data set
## read each of the files

## subject data ----------------------------------
print("loading test files...")
test_s=read.table("test\\subject_test.txt")
test_y=read.table("test\\y_test.txt")
test_x=read.table("test\\X_test.txt")

## ======================= do the same for "training" data ================
print("loading training files...")
train_s=read.table("train\\subject_train.txt")
train_y=read.table("train\\y_train.txt")
train_x=read.table("train\\X_train.txt")

## replace activity codes by descriptive text in both activity code sets ------------------
## better to do it now than after merge for performance reasons
## ************************************************
## ************************************************
## ************************************************
## this is Q3 of the project
## ************************************************
## ************************************************
## ************************************************
print("updating activity values - replace numbers with text...")
test_y[test_y==1]<-"WALKING"
test_y[test_y==2]<-"WALKING_UPSTAIRS"
test_y[test_y==3]<-"WALKING_DOWNSTAIRS"
test_y[test_y==4]<-"SITTING"
test_y[test_y==5]<-"STANDING"
test_y[test_y==6]<-"LAYING"
train_y[train_y==1]<-"WALKING"
train_y[train_y==2]<-"WALKING_UPSTAIRS"
train_y[train_y==3]<-"WALKING_DOWNSTAIRS"
train_y[train_y==4]<-"SITTING"
train_y[train_y==5]<-"STANDING"
train_y[train_y==6]<-"LAYING"

## merge the 3 datasets for test & train respectively with cbind() -----------------------
print("merge 3 test files...")
testData<-cbind(test_s,test_y,test_x)
print("merge 3 training files...")
trainData<-cbind(train_s,train_y,train_x)

## merge the test & train datasets with rbind() ---------------------
## ************************************************
## ************************************************
## ************************************************
## ************************************************
## this is Q1 of the project
## ************************************************
## ************************************************
## ************************************************
## ************************************************
print("merge the test and training files...")
finalData<-rbind(testData,trainData)

## =========================== clean up stuff ============================

## rename all columns to have meaningful names ---------------------------
## for observations, col names are in the features.txt file that must be in the working directory
## features.txt has stuff like commas and parenth, which is not ok for col names,
## clean attribute names as follows (get rid of special characters):
## this order must not be changed
## 1. remove () when they occur together; other instances stiil exist - see below
## 2. replace commas by dots
## 3. replace ( with dot
## 4. remove )
## 5. replace hyphens with dots

print("update column names with clean and meaningful text...")
attrNames<-read.table("features.txt",stringsAsFactors=FALSE)
attrNames2<-unlist(as.list(attrNames[2]))
attrNames2<-gsub("()", "", attrNames2, fixed=TRUE)
attrNames2<-gsub(",", ".", attrNames2, fixed=TRUE)
attrNames2<-gsub("(", ".", attrNames2, fixed=TRUE)
attrNames2<-gsub(")", "", attrNames2, fixed=TRUE)
attrNames2<-gsub("-", ".", attrNames2, fixed=TRUE)

## also assign names to the first 2 columns
attrNamesAsChar<-c("subjectId", "activityName", attrNames2)

## assign the final meaningful column names to the data set
## ************************************************
## ************************************************
## ************************************************
## this is Q4 of the project
## ************************************************
## ************************************************
## ************************************************
names(finalData)<-attrNamesAsChar

## =================== create subset of only columns with mean or std ======================

## we only need mean and stddev data, so create a new dataset with only these
## selection is based on the names of attributes - those that have "mean" or "std" in the name
## but ignore the 7 columns that have the word "mean" but refer to angles, not mean values

print("construct subset of only MEAN and STD data...")
cols0<-names(finalData)
cols1<-grep("mean",cols0,value=TRUE,ignore.case=TRUE)
cols2<-grep("angle",cols1,value=TRUE,ignore.case=TRUE,invert=TRUE)
cols3<-grep("std",cols0,value=TRUE,ignore.case=TRUE)

## get the final list of columns, dont forget the subject & activity columns
cols4<-c("subjectId", "activityName", cols2, cols3)

## get the subset of data; select only columns whose names are in cols4
## ************************************************
## ************************************************
## ************************************************
## this is Q2 of the project
## ************************************************
## ************************************************
## ************************************************
finalData2<-finalData[, colnames(finalData) %in% cols4]

## ============================ do the required tabulation ===============================
## find the mean of all the observations, grouped by subject and activity
## ************************************************
## ************************************************
## ************************************************
## this is Q5 of the project
## ************************************************
## ************************************************
## ************************************************
print("aggregate mean values of all vars by subject and activity...")
summaryData<-aggregate(finalData2[3:81], finalData2[1:2], FUN=mean)

## need to change the column names of the observations
## add "meanOf." as a prefix to all columns except the group columns
print("update column names to reflect the aggregation...")
cols5<-c("subjectId", "activityName", paste("meanOf.", cols4[3:81], sep=""))
colnames(summaryData)<-cols5

## write the output to text file
print("write output file...")
write.table(summaryData, "outputfile.txt", row.name=FALSE)

print("Complete.")

}

## end ========================================================================================

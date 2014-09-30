## problem 1 code 
prob1<-read.csv("problem1.csv",header=TRUE,na.strings = 'NA')
remNA <- is.na(prob1[,"VAL"])
clean <- prob1[!remNA,"VAL"]
millidx <-clean==24
length(clean[millidx])

## problem 3 code
fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
"
download.file(fileURL,destfile = "problem3.xlsx",method = "curl")
dat<-read.xlsx("problem3.xlsx",sheetIndex=1,colIndex = 7:15,rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

## problem 4 code
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
zips <- xpathSApply(doc,"//zipcode",xmlValue)
length(zips[zips==21231])

## problem 5 code
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL,destfile = "problem5.csv",method = "curl")
prob5<-read.csv("problem5.csv",header=TRUE,na.strings = 'NA')
DT <- fread("problem1.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]) 
system.time(rowMeans(DT)[DT$SEX==2])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(mean(DT$pwgtp15,by=DT$SEX))
DT <- data.frame(prob5)
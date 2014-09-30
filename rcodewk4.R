setwd("~/R Code/GettingData Course")

## prob 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL,destfile = "prob1_4.csv",method = "curl")

prob1<-read.csv("prob1_4.csv",header=TRUE,na.strings = 'NA')
splitnames = strsplit(names(prob1),"wgtp")

## prob 2 and 3
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL,destfile = "prob2_4.csv",method = "curl")
GDP<-read.csv("prob2_4.csv",header = FALSE,stringsAsFactors=FALSE,na.strings = "NA")
GDPFilt <- (GDP[6:195,c(1,2,4,5)])
GDPFilt$V5 <- gsub(",","",GDPFilt$V5)
GDPFilt$V5 <- as.numeric(GDPFilt$V5)
mean(GDPFilt$V5)
names(GDPFilt)[3] <- "countryNames"
grep("^United",GDPFilt$countryNames)

## prob 4
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL2,"prob4_4ED.csv",method="curl")
EDU <- read.csv("prob3_3ED.csv",header = TRUE,stringsAsFactors=FALSE,na.strings = "NA")
mergedData <- merge(GDPFilt,EDU,by.x="V1",by.y="CountryCode",all=FALSE)
idx<-grep("end: June",mergedData$Special.Notes)
length(idx)

## prob 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
class(sampleTimes)
weekDay <- weekdays(sampleTimes)
Years <- year(sampleTimes)
YearIdx <- Years == 2012

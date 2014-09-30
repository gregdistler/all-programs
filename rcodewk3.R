## prob 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL,destfile = "prob1_3.csv",method = "curl")

prob1<-read.csv("prob1_3.csv",header=TRUE,na.strings = 'NA')

agricultureLogical <- prob1$ACR == 3 & prob1$AGS == 6

## prob 2
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL,destfile = "prob2_3.jpg",mode = "wb")
image <- readJPEG("prob2_3.jpg",native = TRUE)
quantile(image,probs = c(.3,.8))

## prob 3, 4, 5
fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL1,"prob3_3GDP.csv",method="curl")
download.file(fileURL2,"prob3_3ED.csv",method="curl")

GDP <- read.csv("prob3_3GDP.csv",header = FALSE,stringsAsFactors=FALSE,na.strings = "NA")
EDU <- read.csv("prob3_3ED.csv",header = TRUE,stringsAsFactors=FALSE,na.strings = "NA")
GDPFilt <- (GDP[6:195,c(1,2,4,5)])
GDPFilt$V2 <- as.integer(GDPFilt$V2)
GDPFilt$V5 <- gsub(",","",GDPFilt$V5)
GDPFilt$V5 <- as.numeric(GDPFilt$V5)
mergedData <- merge(GDPFilt,EDU,by.x="V1",by.y="CountryCode",all=FALSE)
sortMerged <- mergedData[order(-mergedData$V2),]
## prob 4
idx1 <- mergedData$Income.Group == "High income: OECD"
mean(mergedData$V2[idx1])
idx2 <- mergedData$Income.Group == "High income: nonOECD"
mean(mergedData$V2[idx2])
## prob 5
mergedData$GDPQuants <- cut2(mergedData$V2,g = 5)
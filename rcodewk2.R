## class

##problem1
github<-oauth_endpoints("github")
myapp <- oauth_app("github", key = "9b631e58d6f2fcf0be18",secret="aba99bd6a454ea93f0c4f3102f09e7e39ea050a1")
github_token <- oauth2.0_token(github, myapp)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
jsondata<-content(req)
json2 <-jsonlite::fromJSON(toJSON(jsondata))


## problem2
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileURL,destfile = "problem2_2.csv",method = "curl")
acs<-data.frame(read.csv("problem2_2.csv",header=TRUE,na.strings = 'NA'))
sqldf("select pwgtp1 from acs where AGEP < 50")

## problem 4
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])

## problem 5
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURL,destfile = "problem5_2.for",method = "curl")
dat <-read.fwf("problem5_2.for",c(10,9,4,9),header=FALSE,skip=4,na.strings = 'NA')


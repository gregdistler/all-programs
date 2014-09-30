setwd("~/R Code/Exploratory Data")
library(ggplot2)

str(mpg)

qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,color=drv)
##add a geom - points of data and then smoothed data
qplot(disp,hwy,data=mpg,geom=c("point","smooth"))
## hist on hwy but color by drive type - hist is made by specifying one variable
qplot(hwy,data=mpg,fill=drv)
## facets - like panels in lattice, make different subsets
## similar to above but separate into multiple plots instead of color coding
qplot(displ,hwy,data=mpg,facets=.~drv) ## "." used b/c no row 
qplot(displ,data=mpg,facets=drv~.,binwidth=2) ## "." used because no column


## quiz 2,7
library(datasets)
data(airquality)
airquality = transform(airquality, Month=factor(Month))
qplot(Wind,Ozone,data=airquality,facets=.~Month)

## quiz 2,9
g <- ggplot(movies, aes(votes, rating))
print(g) ## won't print
summary(g)
p<-g+geom_point()
g+geom_point()+geom_smooth()
g+geom_point()+geom_smooth(method="lm")

## quiz 2,10
qplot(votes, rating, data = movies) + geom_smooth()
print(p)
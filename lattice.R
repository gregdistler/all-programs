setwd("~/R Code/Exploratory Data")
library(lattice)
library(datasets)

##simple
xyplot(Ozone ~ Wind, data = airquality)

## convert month to factor
airquality <- transform(airquality, Month=factor(Month))
## plot by month
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

## print without autoprinting
p <- xyplot(Ozone ~ Wind, data = airquality) ## store as object
print(p) ## plot appears

## panel
set.seed(10)
x <- rnorm(100)
f <- rep(0:1,each = 50)
y <- x + f - f * x + rnorm(100,sd=.5)
f <-factor(f, labels = c("Group 1","Group 2"))
xyplot(y~x | f, layout = c(2,1)) ##plot 2 panels on f
##now with custom panel function
xyplot(y~x | f, panel = function(x,y,...) {
      panel.xyplot(x,y,...)  ## first call default panel function
      panel.abline(h=median(y),lty=2) ##adds line
})
xyplot(y~x | f, panel = function(x,y,...) {
      panel.xyplot(x,y,...)  ## first call default panel function
      panel.lmline(x,y,col=2) ##adds simple linear line
})




##2,2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

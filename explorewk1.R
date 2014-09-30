pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric","character","factor","numeric","numeric"))
##explore graphs
summary(pollution$pm25)
boxplot(pollution$pm25, col = "blue")
abline(h=12)
hist(pollution$pm25, col = "green")
rug(pollution$pm25)
hist(pollution$pm25, col = "green",breaks = 100)
hist(pollution$pm25, col = "green")
abline(v=12, lwd =2)
abline(v=median(pollution$pm25), col = "magenta",lwd=4)
barplot(table(pollution$region),col = "wheat", main = "Number of Counties in Each Region")
boxplot(pm25 ~ region, data=pollution, col = "red")
par(mfrow = c(2,1),mar=c(4,4,2,1))
hist(subset(pollution,region == "east")$pm25,col="green")
hist(subset(pollution,region == "west")$pm25,col = "green")
with(pollution, plot(latitude,pm25))
abline(h=12,lwd=2,lty=2)
with(pollution,plot(latitude,pm25,col = region))
abline(h=12,lwd=2,lty=2)
par(mfrow = c(1,2),mar=c(5,4,2,1))
with(subset(pollution,region == "west"),plot(latitude,pm25,main = "West"))
with(subset(pollution,region == "east"),plot(latitude,pm25,main = "East"))

## base plot
library(datasets)
data(cars)
with(cars,plot(speed,dist))

library(lattice)
states <- data.frame(state.x77,region = state.region)
xyplot(Life.Exp ~Income | region, data=states,layout = c(4,1))

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

## base plotting
library(datasets)
hist(airquality$Ozone)
with(airquality,plot(Wind,Ozone))
airquality<-transform(airquality,Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month",ylab = "Ozone (ppb)")

with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in NYC"))
with(subset(airquality, Month==5),points(Wind,Ozone,col="blue"))

with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in NYC"),type="n")
with(subset(airquality, Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality, Month!=5),points(Wind,Ozone,col="red"))
legend("topright",pch=1, col = c("blue","red"),legend=c("may","not may"))
##add reg line
with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in NYC",pch=20))
model<-lm(Ozone~Wind,airquality)
abline(model,lwd=2)
##mult
par(mfrow=c(1,3),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(airquality, {
      plot(Wind,Ozone,main="Ozone and Wind")
      plot(Solar.R,Ozone,main = "Ozone and Solar")
      plot(Temp,Ozone,main = "Ozone and temp")
      mtext("ozone and weather in nyc",outer=TRUE)
})

##file device
pdf(file="myplot.pdf") ##open pdf device
with(faithful,plot(eruptions,waiting))
title(main = "Old Faithful Geyser Data")
dev.off()
## copying
with(faithful,plot(eruptions,waiting))
title(main="old faithful geyser data")
dev.copy(png,file="geyserplotwk1.png")
dev.off()
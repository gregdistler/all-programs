setwd("~/R Code/Exploratory Data")

## set data
set.seed(1234)
par(mar=c(0,0,0,0))
x<-rnorm(12,mean=rep(1:3,each=4),sd=.2)
y<-rnorm(12,mean=rep(c(1,2,1),each=4),sd=.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+.05,y+.05,labels=as.character(1:12))
dataFrame <- data.frame(x=x,y=y)
distxy<-dist(dataFrame) ## calc differences between all points
hClustering <- hclust(distxy) ## build clustering tree
plot(hClustering)

## heatmap
dataFrame <-data.frame(x=x,y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

## k-means clustering
## use previous data
dataFrame <- data.frame(x=x,y=y)
kmeansObj <- kmeans(dataFrame,centers=3)
names(kmeansObj)
par(mar=rep(.2,4))
plot(x,y,col = kmeansObj$cluster,pch=19,cex =2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)

## k-means with heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix,centers=3)
par(mfrow=c(1,2),mar=c(2,4,.1,.1))
image(t(dataMatrix)[,nrow(dataMatrix):1],yaxt="n")
image(t(dataMatrix)[,order(kmeansObj$cluster)],yaxt="n")
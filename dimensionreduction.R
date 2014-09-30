setwd("~/R Code/Exploratory Data")

set.seed(12345)
par(mar=rep(.2,4))
dataMatrix <- matrix(rnorm(400),nrow=40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)
##now add pattern
set.seed(678910)
for (i in 1:40){
      #flip coin
      coinFlip <- rbinom(1,size=1,prob=.5)
      # if coin is heads add a common pattern to row
      if (coinFlip){
            dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
      }
}
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)
## take closer look at rows and columns
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered),40:1,,xlab="row mean",ylab="row",pch =19)
plot(colMeans(dataMatrixOrdered),xlab="Column",ylab="Col Mean",pch=19)

## svd decomp
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd1$u[,1],40:1,,xlab="row",ylab="first left sing vec",pch =19)
plot(svd1$v[,1],xlab="Column",ylab="first right sing vec",pch=19)
## variance explained - ordered in most to least
par(mfrow=c(1,2))
plot(svd1$d,xlab="column",ylab="singular value",pch=19) #raw
plot(svd1$d^2/sum(svd1$d^2),xlab="column",ylab= "prop of variance explained", pch=19) #square divided by sum of squares
## above shows that almost 40% explained by one dimension

## compare to pca
svd1<-svd(scale(dataMatrixOrdered))
pca1<-prcomp(dataMatrixOrdered,scale=TRUE)
plot(pca1$rotation[,1],svd1$v[,1],pch=19,xlab="PCA 1", ylab="Right Singular Vec 1")
abline(c(0,1))




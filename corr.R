corr <- function(directory, threshold = 0) {
      id <- 1:332
      corrstorage <- c()
      counter = 1
      for(i in 1:length(id)){
            tempfile = as.character(id[i])
            if(id[i]<10){
                  tempname = paste("00",tempfile,sep="")
            } else if (id[i]<100) {
                  tempname = paste("0",tempfile,sep="")
            } else {
                  tempname = tempfile
            }
            filename <- paste(directory,"/",tempname,".csv",sep = "")
            data <- read.csv(filename)
            good <- complete.cases(data)
            gooddata <- data[good,]
            if(length(gooddata[,"sulfate"])>threshold) {
                  corrstorage[counter] = cor(gooddata[,"sulfate"],gooddata[,"nitrate"])
                  counter = counter + 1
            }
      }
      corrstorage
}
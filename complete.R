complete <- function(directory, id = 1:332) {
      nobs = c()
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
            gooddata <- complete.cases(data)
            nobs[i] = sum(gooddata)
      }
      data.frame(id,nobs)
}
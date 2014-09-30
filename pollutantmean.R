pollutantmean <- function(directory, pollutant, id = 1:332) {
      sumdata = 0
      lengthdata = 0
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
            baddata <- is.na(data[,pollutant])
            sumdata = sumdata+ sum(data[!baddata,pollutant])
            lengthdata = lengthdata + length(data[!baddata,pollutant])
      }
      sumdata/lengthdata
}
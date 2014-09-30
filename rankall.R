rankall <- function(outcome, num= "best") {
      ## read data
      alldata <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character",na.strings = "Not Available")
      if (outcome != "heart attack") {
            if (outcome != "heart failure"){
                  if (outcome != "pneumonia"){
                        stop('invalid outcome')
                  }
            }
      }
      if (outcome == "heart attack"){
            outCol <- 11
      } else if(outcome == "heart failure"){
            outCol <- 17
      } else if(outcome == "pneumonia"){
            outCol <- 23
      }
      hospital <- c()
      state <- sort(unique(alldata[,7]))
      for(i in 1:length(statelist)){
            stateidx <- alldata[,7]==state[i]
            statedata <- alldata[stateidx,]
            ## remove na
            statedata <- statedata[!is.na(statedata[,outCol]),]
            sortedstatedata <- statedata[order(as.numeric(statedata[,outCol]),statedata[,2]),]
            if (num == "best") {
                  ranking <-1
                  hospital[i]=sortedstatedata[ranking,2]
            } else if (num == "worst"){
                  ranking <- length(sortedstatedata[,2])
                  hospital[i]=sortedstatedata[ranking,2]
            } else if (num > length(sortedstatedata[,2])){
                  hospital[i]=NA
            } else {
                  ranking <- num
                  hospital[i]=sortedstatedata[ranking,2]
            }
      }
      ## final output
      data.frame(hospital,state)
}
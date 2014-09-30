best <- function(state, outcome) {
      ## read data
      alldata <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses="character",na.strings = "Not Available")
      ## find state rows
      stateidx <- alldata[,7]==state
      ## check valid state and outcome
      if (length(alldata[stateidx,7])==0) {
            stop('invalid state')
      } 
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
      statedata <- alldata[stateidx,]
      ## remove na
      statedata <- statedata[!is.na(statedata[,outCol]),]
      sortedstatedata <- statedata[order(as.numeric(statedata[,outCol]),statedata[,2]),]
      sortedstatedata[1,2]
}
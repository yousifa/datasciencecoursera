complete <- function(directory, id = 1:332) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     ## 'id' is an integer vector indicating the monitor ID numbers
     ## to be used
     
     ## Return a data frame of the form:
     ## id nobs
     ## 1  117
     ## 2  1041
     ## ...
     ## where 'id' is the monitor ID number and 'nobs' is the
     ## number of complete cases
     
     files <- list.files(directory)
     nobs <- numeric()
     for(i in id)
     {
          if(i<10)
          {
               tmp <- read.csv(paste(directory,"/00",i,".csv",sep=""))
          }
          else
          {
               if(i<100)
               {
                    tmp <- read.csv(paste(directory,"/0",i,".csv",sep=""))
               }
               else
               {
                    tmp <- read.csv(paste(directory,"/",i,".csv",sep=""))
               }
          }
          if(nrow(subset(tmp, ID %in% id))>0)
          {
               numObs<- nrow((na.omit(tmp)))
               nobs <- c(nobs,numObs)
          }
     }
     ds <- data.frame(id,nobs)
     ds
}
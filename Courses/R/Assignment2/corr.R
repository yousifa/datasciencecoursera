corr <- function(directory, threshold = 0) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     ## 'threshold' is a numeric vector of length 1 indicating the
     ## number of completely observed observations (on all
     ## variables) required to compute the correlation between
     ## nitrate and sulfate; the default is 0
     
     ## Return a numeric vector of correlations
     
     numObservations<-complete(directory)
     numObservations<-subset(numObservations,nobs>threshold)
     files <- list.files(directory)
     correlation <- numeric()
     for(i in numObservations[["id"]])
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
          tmp <- na.omit(tmp)
          correlation <-c(correlation,cor(tmp$sulfate,tmp$nitrate))
     }
     correlation
}
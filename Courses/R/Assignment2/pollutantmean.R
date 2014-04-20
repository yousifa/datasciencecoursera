pollutantmean <- function(directory, pollutant, id = 1:332) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     ## 'pollutant' is a character vector of length 1 indicating
     ## the name of the pollutant for which we will calculate the
     ## mean; either "sulfate" or "nitrate".
     
     ## 'id' is an integer vector indicating the monitor ID numbers
     ## to be used
     
     ## Return the mean of the pollutant across all monitors list
     ## in the 'id' vector (ignoring NA values)
     
     files <- list.files(directory)
     for (i in 1:length(files))
     {
          #print(paste(directory,"/",files[i],sep=""))
          tmp <- read.csv(paste(directory,"/",files[i],sep=""))
          if(exists("mainData"))
          {
               mainData <- rbind(mainData,tmp)
          }
          else
          {
               mainData<- tmp
          }
          #print(mainData)
     }
     mainData <- subset(mainData, ID %in% id)
     means <- colMeans(mainData[pollutant], na.rm=TRUE)
     means[[pollutant]]
     #print(mainData)
     #write.csv(x=mainData,file="test.csv")
}
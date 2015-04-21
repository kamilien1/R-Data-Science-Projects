pollutantmean <- function(directory, pollutant, id = 1:332) {
    

    idlist <- list.files(directory, full.names=TRUE)       
    used <- data.frame()                             
    for (i in id) {    
        print(paste("i is now",i))
        used <- rbind(used, read.csv(idlist[i]))
    }
    
    mean(used[[pollutant]], na.rm=TRUE)
}

#pollutantmean("specdata","nitrate",1:9)
#pollutantmean("specdata", "nitrate")
pollutantmean("specdata", "sulfate", 1:10)
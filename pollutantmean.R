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
    
    # initialize pollutant data
    pollutant_file <- {}
    
    for (i in id) {
        
        # sprintf %03d ensures a standard 3 digit length number
        # taken from https://class.coursera.org/rprog-013/forum/thread?thread_id=324
        f_name <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
        f_read <- read.csv(f_name)
        
        # concat all pollutant data into this variable
        pollutant_file <- c(pollutant_file,f_read[,pollutant])
    }

    # get mean and return it rounded to 3 digits
    mean_pollutant <- mean(pollutant_file,na.rm=T)
    round(mean_pollutant,digits = 3)
   
}

specdata = "specdata"
pollutant = "sulfate"
#all_files <- list.files(specdata)

#source(specdata)
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

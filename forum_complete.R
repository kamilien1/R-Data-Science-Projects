complete <- function(directory, id = 1:332) {
    
    # list all file names with complete paths
    # like /specdata/xxx.csv
    dy <- list.files(directory, full.names = T)
    # dx will store results of complete rows
    # df will read in current file
    # df_subset stores complete cases
    dx <- data.frame()
    df <- vector()
    df_subset <- vector()
      for(i in id){ 
          # read the file
           df <- read.csv(dy[i])
           # get complete cases, all columns
           df_subset <- df[complete.cases(df),]
           # number of rows
           nobs <- nrow(df_subset)
           print(paste("nobs is now",nobs,"i is now",i))
           # dataframe gets id, nobs 
           # NOTE: ID is VERY different than I
           dx <- data.frame(id, nobs)
           print(paste("dx is now",dx))
           print(paste("cbind is",cbind("id","nobs")))
           cbind("id", "nobs")
         }
          print(dx)
     }

complete("specdata", 25:30)

weightmedian <- function(directory, day)  {
    files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
    dat <- data.frame()                             #creates an empty data frame
    for (i in 1:5) {                                
        #loops through the files, rbinding them together 
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
    median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
    #while stripping out the NAs

}

weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)


weightmedian2 <- function(directory, day)  {
    files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
    dat <- data.frame()                             #creates an empty data frame
  
    # way number 2
    summary(files_full)
    tmp <- vector(mode = "list", length = length(files_list))
    summary(tmp)
    
   # for (i in seq_along(files_full)) {
    #    tmp[[i]] <- read.csv(files_full[[i]])
    #}
    #str(tmp)
    # OR 
   tmp <- lapply(files_list,read.csv)
    # applys read.csv to each line in files_list!
    # call rbind on all elements in tmp
   output <- do.call(rbind, tmp)
    output
}
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
    
    
    output_file <- matrix(nrow=0,ncol=2)
    colnames(output_file)<-c("id","nobs")
    
    # to add a new row, do output_file <-rbind(output_file,c(val1,val2))
    
    for (i in id) {
        
        # sprintf %03d ensures a standard 3 digit length number
        # taken from https://class.coursera.org/rprog-013/forum/thread?thread_id=324
        f_name <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
        f_read <- read.csv(f_name)
        
        
        # add a row with i and # of complete cases (dim(thingy)[rows])
        #print(paste("i is",i))
        #print(paste("complete cases is",dim(complete.cases(f_read))[1]))
        #print("complete cases is")
        #print(dim(f_read[complete.cases(f_read),]))[1]
        
        output_file <- rbind(output_file,c(i,dim(f_read[complete.cases(f_read),])[1]))
    
        
    }
    as.data.frame(output_file)
}

#specdata <- "specdata"
# complete(specdata,1:5)
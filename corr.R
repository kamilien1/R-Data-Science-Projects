corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    output_file <- {}
    
    # for iteration purposes
    all_files <- list.files(directory)
    num_files <- length(list.files(directory))
    
    # threshold and create a new matrix
    for (i in all_files){
        
        f_name <- paste(directory,"/",i,sep="")
        f_read <- read.csv(f_name)
        
        # output_file <- rbind(output_file,c(i,dim(f_read[complete.cases(f_read),])[1]))
        
        num_cases <- dim(f_read[complete.cases(f_read),])[1]
        
        # if num_cases > threshold, add to list
       
        if (num_cases > threshold) {
            
            
            temp_complete_cases <- complete.cases(f_read)
            temp_complete_matrix <-f_read[temp_complete_cases,2:3]
            temp_cor <- cor(temp_complete_matrix[,1],temp_complete_matrix[,2])
            
            output_file <- c(output_file, temp_cor)
            
            
        }
        
    }
    

   output_file
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
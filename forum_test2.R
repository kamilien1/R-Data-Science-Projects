corr <- function(directory, threshold = 0) {
    
    temp <- {}
    
    final <- vector(mode = "integer", length = 332)
    
    files_list <- list.files(directory, full.names = TRUE)
    
    for (i in 1:332) {
        
        current_file <- read.csv(files_list[i])
        only_completely_observed <- nrow(na.omit(current_file))
        clean_file <- na.omit(current_file)
    }
    if(only_completely_observed > threshold) {
        temp <- cor(clean_file["sulfate"], clean_file["nitrate"], use = "complete.obs")
    }   
    final <- c(final, temp)
    final
}

d <- corr("specdata",400)
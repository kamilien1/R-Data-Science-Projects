
directory <-"specdata"
id<-1:10
files <- list.files(directory)
table <- data.frame(row.names=c("id","nobs"))

for (i in id){
    values <- read.csv(paste(directory,"/",files[i],sep=""))
    com_case <- complete.cases(values)
    len <- nrow(values[com_case,2:3])
    
    table <- rbind(table,id=i,nobs = len)
} 

print(table)
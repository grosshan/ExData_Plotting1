loadEPCData <- function(){
  
  library(sqldf)
  
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  t_zipfile <- tempfile()
  t_csvdir <- tempdir()
  
  download.file(url = url, destfile = t_zipfile, method = "curl", quiet = TRUE)
  unzip(t_zipfile, exdir = paste(t_csvdir,"unzipped",sep ="/"))
  
  filename <- paste(t_csvdir,"unzipped",dir(paste(t_csvdir,"unzipped",sep = "/")),sep = "/")

  data <- read.csv.sql(filename, 
                       sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                       sep = ";", header = TRUE)
}
# Function that download and read the data "Houseold Power Consumption". 
# Returns a frame with 2880 obs of 9 variables
loadEPCData <- function(){
  
  # we need this package for a fast reading of data
  library(sqldf)
  
  # locations where data should downloaded from and where we store it (temporarily)
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  t_zipfile <- tempfile()
  t_csvdir <- tempdir()
  
  # download and unzip the data
  download.file(url = url, destfile = t_zipfile, method = "curl", quiet = TRUE)
  unzip(t_zipfile, exdir = paste(t_csvdir,"unzipped",sep ="/"))
  
  # read data from 01/02/2007 & 02/02/2007
  filename <- paste(t_csvdir,"unzipped",dir(paste(t_csvdir,"unzipped",sep = "/")),sep = "/")
  data <- read.csv.sql(filename,
                       sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                       sep = ";", header = TRUE)
  
  # close Connections and return data
  closeAllConnections()
  return(data)
  
}
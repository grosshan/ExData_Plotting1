# function that creates & saves the 2nd plot to plot2.png
plot2 <- function(){
  
  # download & read the data
  data <- loadEPCData()
  
  #create device
  png("./plot2.png",height = 480,width = 480, bg = "transparent")
  
  # values are determined and plotted without an x-axis (german R Version would print Do Fr Sa instead of Thu Fri Sat)
  x <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
  plot(x = x, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
  
  # now create x-axis with desired margin and label
  labels <- as.double.POSIXlt(c("2007-02-01 00:00:00 CET","2007-02-02 00:00:00 CET","2007-02-03 00:00:00 CET"))
  axis(side = 1,line = 0,labels = c("Thu","Fri","Sat"), at = labels)
  
  #close device & return null
  dev.off()
  return(NULL)
}
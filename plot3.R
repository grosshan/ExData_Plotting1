# function that creates & saves the 3rd plot to plot3.png
plot3 <- function(){
  
  # download & read the data
  data <- loadEPCData()
  
  #create device
  png("./plot3.png",height = 480,width = 480, bg = "transparent")
  
  # values are determined and plotted without an x-axis (german R Version would print Do Fr Sa instead of Thu Fri Sat)
  x <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
  plot(x = x, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "black")
  lines(x = x, y = data$Sub_metering_2, type = "l", col = "red")
  lines(x = x, y = data$Sub_metering_3, type = "l", col = "blue")
  legend('topright', names(data)[7:9],col = c("black","red","blue"), lty = 1)
  
  # now create x-axis with desired margin and label
  labels <- as.double.POSIXlt(c("2007-02-01 00:00:00 CET","2007-02-02 00:00:00 CET","2007-02-03 00:00:00 CET"))
  axis(side = 1,line = 0,labels = c("Thu","Fri","Sat"), at = labels)

  #close device & return null
  dev.off()
  return(NULL)
}
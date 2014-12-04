# function that creates & saves the 3rd plot to plot3.png
plot4 <- function(){
  
  # download & read the data
  data <- loadEPCData()
  
  #create device
  png("./plot4.png",height = 480,width = 480, bg = "transparent")
  
  # values are determined and plotted without an x-axis (german R Version would print Do Fr Sa instead of Thu Fri Sat)
  x <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

  # set individual things (column, label) for each plot
  colors <- c("black","red","blue")
  columns <- list(3,7:9,5,4)
  ylabs <- c("Global Active Power","Energy sub metering","Voltage","Global_reactive_power")
  xlabs <- c("","","datetime","datetime")
  # layout
  layout(matrix(1:4,2,2))
  for (i in 1:4){
    plot(x = x, y = data[[columns[[i]][[1]]]], type = "l", xlab = xlabs[i], ylab = ylabs[i], xaxt = "n", col = colors[1])
    if(length(columns[[i]]) >= 2){
      legend('topright', names(data)[columns[[i]]],col = colors[1:length(columns[[i]])], lty = 1, bty = "n")
      for(j in 2:length(columns[[i]])){
        lines(x = x, y = data[[columns[[i]][[j]]]], type = "l", col = colors[j])
      }
    }
    labels <- as.double.POSIXlt(c("2007-02-01 00:00:00 CET","2007-02-02 00:00:00 CET","2007-02-03 00:00:00 CET"))
    axis(side = 1,line = 0,labels = c("Thu","Fri","Sat"), at = labels)
  }
#  plot(x = x, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "black")
#  lines(x = x, y = data$Sub_metering_2, type = "l", col = "red")
#  lines(x = x, y = data$Sub_metering_3, type = "l", col = "blue")
#  legend('topright', names(data)[7:9],col = c("black","red","blue"), lty = 1)
  
  # now create x-axis with desired margin and label
  
  #close device & return null
  dev.off()
  return(NULL)
}
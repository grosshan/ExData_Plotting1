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
  
  # layout = 2x2
  layout(matrix(1:4,2,2))
  
  # now plot all figures
  for (i in 1:4){
    # first line in black, figure without x-axis
    # (german R Version would print Do Fr Sa instead of Thu Fri Sat)
    plot(x = x, y = data[[columns[[i]][[1]]]], type = "l", xlab = xlabs[i], ylab = ylabs[i], xaxt = "n", col = colors[1])
    
    # are there other lines to draw? plot them too (we need a legend then)
    if(length(columns[[i]]) >= 2){
      legend('topright', names(data)[columns[[i]]],col = colors[1:length(columns[[i]])], lty = 1, bty = "n")
      for(j in 2:length(columns[[i]])){
        lines(x = x, y = data[[columns[[i]][[j]]]], type = "l", col = colors[j])
      }
    }
    
    # now we draw the x-axis with english labels
    labels <- as.double.POSIXlt(c("2007-02-01 00:00:00 CET","2007-02-02 00:00:00 CET","2007-02-03 00:00:00 CET"))
    axis(side = 1,line = 0,labels = c("Thu","Fri","Sat"), at = labels)
  }
  
  #close device & return null
  dev.off()
  return(NULL)
}
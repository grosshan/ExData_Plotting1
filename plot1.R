# function that creates & saves the 1st plot to plot1.png
plot1 <- function(){

  # download & read the data
  data <- loadEPCData()
  
  #create device
  png("./plot1.png",height = 480,width = 480, bg = "transparent")

  # values are determined and plotted without an x-axis
  values <- table(floor(data$Global_active_power/0.5))
  barplot(values, space = 0, col = "red", ylim = c(0,1200), 
          xpd = TRUE, width = 0.5, ylab = "Frequency", main = "Global Active Power", xaxt = "n")

  # now create x-axis with desired margin and label
  axis(side = 1,line = 1,at = c(0,2,4,6))
  mtext("Global Active Power (kilowatts)", side = 1, line = 4)
  par(mar = c(6,4,4,2))
  
  #close device & return null
  dev.off()
  return(NULL)
}
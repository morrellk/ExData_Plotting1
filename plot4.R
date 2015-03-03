##   Code to create plot4 for course project 1 in Coursera course: Exploratory
##   Data Analysis.  
##
##
plot4 <- function(){
     ##   Read in the data - but only want the two days of interest
     suppressWarnings({
          e_data <- subset(fread("household_power_consumption.txt", sep=";", 
                                 header=TRUE, na.strings="?"),
                           Date== "1/2/2007" | Date == "2/2/2007")
     })
     
     ##   Need to convert Date and Time columns to POSIX format to
     ##   get the weekday for the x axis. 
     ##   Note: capital on the year is important - otherwise get wrong
     ##        days of the week.
     ##
     d2 <- as.POSIXct(paste((as.Date(e_data$Date, "%d/%m/%Y")), e_data$Time))
     e_data <- cbind(e_data, d2)
     
     ##   Plot four plots on one page/window
     ##   First - open up the appropriate graphics device: png
     png(file = "plot4.png", bg="transparent", width=480, height=480)
     
     ## Layout 2x2
     par(mfrow=c(2,2))
     
     ## Global active power vs time
     plot(e_data$d2, e_data$Global_active_power, 
          col= "black", type = "l", xlab = "",
          ylab = "Global Active Power ")
     
     ## Voltage vs time
     plot(e_data$d2,e_data$Voltage,col="black",type="l",xlab="datetime",
          ylab="Voltage")
     
     ## The plot with three lines - Sub_metering
     plot(e_data$d2, e_data$Sub_metering_1, 
          col= "black", type = "l", xlab = "",
          ylab = "Energy sub metering")
     lines(e_data$d2, e_data$Sub_metering_2, col="red")
     lines(e_data$d2, e_data$Sub_metering_3, col="blue")
     legend("topright",col=c("black","red","blue"), lty=1, bty="n",
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     
     ## Global reactive power vs time
     plot(e_data$d2,e_data$Global_reactive_power,col="black",type="l",
          ylab="Global_reactive_power", xlab="datetime")
     
     ## close the graphics device.
     dev.off()
}
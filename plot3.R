##   Code to create plot3 for course project 1 in Coursera course: Exploratory
##   Data Analysis.  
##
##
plot3 <- function(){
     ##   Read in the data -  two days of interest
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
     
     
     ##   Plot the sub_metering data
     ##   First - open up the appropriate graphics device: png
     png(file = "plot3.png", bg="transparent", width=480, height=480)
     plot(e_data$d2, e_data$Sub_metering_1, 
          col= "black", type = "l", xlab = "",
          ylab = "Energy sub metering")
     
     ## Add the other lines
     lines(e_data$d2, e_data$Sub_metering_2, col="red")
     lines(e_data$d2, e_data$Sub_metering_3, col="blue")
     
     ## Add the legend
     legend("topright",col=c("black","red","blue"), lty=1, 
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     dev.off()
}
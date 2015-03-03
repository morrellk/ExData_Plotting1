##   plot2.R
##
##   Code to create plot2 for course project 1 in Coursera course: Exploratory
##   Data Analysis.  
##
##
plot2 <- function(){
     ##   Read in the data - two days of interest
     suppressWarnings({
          e_data <- subset(fread("household_power_consumption.txt", sep=";", 
                            header=TRUE, na.strings="?"),
                      Date== "1/2/2007" | Date == "2/2/2007")})

     
     ##   Need to use weekdays(as.Date(e_data$Date,"%d/%m/%Y")) to
     ##   get the weekday for the x axis. 
     ##   Note: capital on the year is important
     ##
     d2 <- as.POSIXct(paste((as.Date(e_data$Date, "%d/%m/%Y")), e_data$Time))
     e_data <- cbind(e_data, d2)

     
     ##   Plot the global active power vs time
     ##   First - open up the appropriate graphics device: png
     png(file = "plot2.png", bg="transparent", width=480, height=480)
     plot(e_data$d2, e_data$Global_active_power, 
          col= "black", type = "l", xlab = "",
          ylab = "Global Active Power (kilowatts) ")
     dev.off()
}
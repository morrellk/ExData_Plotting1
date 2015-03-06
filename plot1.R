##   plot1.R
##
##   Code to create plot1 for course project 1 in Coursera course: Exploratory
##   Data Analysis.  
##
##   Reads in household_power_consumption.txt dataset and constructs plots
##   from two days worth of data from 1st and 2nd of Feb, 2007.
##
##   The data file is available on the course website at: 
##   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##   and comes from the UC Irvine Machine Learning Repository
##   This function assumes that the data file has already been downloaded.
##
plot1 <- function(){
     ##   Read in the data - but only interested in two days of it
     ##   fread() creates warnings due to "?", don't want to see those.
     suppressWarnings({
          e_data <- subset(fread("household_power_consumption.txt", sep=";", 
                            header=TRUE, na.strings="?"),
                      Date== "1/2/2007" | Date == "2/2/2007")})
     
     ##   Plot a histogram of the global active power and
     ##   save it as plot1.png.
     ##
     png(file = "plot1.png", bg="transparent", width=480, height=480)
     hist(as.numeric(e_data$Global_active_power), col= "red",
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts) ")
     dev.off()
}
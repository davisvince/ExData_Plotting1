# Vincent Davis
# Coursera Data Science Specialization
# Exploratory Data Analysis
# Project 1
# Plot 1 code

#first we set the directory & load the data file; since we will do this for all 4
#plots in this project, we'll create a function to handle this identical task
loadPlotData <- function(){
#set R working directory to local course directory
setwd("D:/Documents/Education/Coursera/Data Science Specialization/ExploratoryDataAnalysis/Project1")

#now we download the raw data (zip file), if it does not already exist
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename<-"household_power_consumption.zip"
if (!file.exists(filename)){
     download.file(URL, filename)
}

#similarly if not already unzipped (directory exists), unzip now
if (!file.exists("exdata-data-household_power_consumption")) { 
     unzip(filename) 
}

#now we load the raw file into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#finally, we subset to isolate just the data we need
target.data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
}

#with the data successfully loaded, we can build our plot:
datetime <- strptime(paste(target.data$Date, target.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#first plot in quadrant
plot(datetime, as.numeric(target.data$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
#second plot in quadrant
plot(datetime, as.numeric(target.data$Voltage), type="l", xlab="datetime", ylab="Voltage")
#third plot in quadrant
plot(datetime, as.numeric(target.data$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(datetime, as.numeric(target.data$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(target.data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#forth plot in quadrant
plot(datetime, as.numeric(target.data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


## PLOT 3:  Energy sub metering trought time, scatter

## data extraction and treatment

datadir <- "./household_power_consumption.txt"

data <- read.table(datadir,sep=";",
                   header = TRUE,
                   na.strings = "?",
                   colClasses = c(Date="character",Time="character",rep("numeric",7)))#data import

data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format="%d/%M/%Y %H:%M:%S") # reformating of date and time values
data$Date <- as.Date(data$Date, format="%d/%m/%Y") # reformating of date


data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date(" 2007-02-02")) # subsetting the data


## Plot 3

png(filename = "Plot3.png", # graphics device start
    width = 480, height = 480, units = "px") #size

plot(data2$Time, data2$Sub_metering_1,type="l", xlab="",ylab="") #plot initialization
lines(data2$Time, data2$Sub_metering_1, col="black") #line input1
lines(data2$Time, data2$Sub_metering_2, col="red") #line input2
lines(data2$Time, data2$Sub_metering_3, col="blue") #line input3
legend("topright",lty=c(1,1,1), col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
title(ylab="Energy sub metering") #other annotation

dev.off() # Graphics device off
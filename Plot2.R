
## PLOT 2 :  Global Active Power trough time, scatter

## data extraction and treatment

datadir <- "./household_power_consumption.txt"

data <- read.table(datadir,sep=";",
                   header = TRUE,
                   na.strings = "?",
                   colClasses = c(Date="character",Time="character",rep("numeric",7)))#data import

data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format="%d/%M/%Y %H:%M:%S") # reformating of date and time values
data$Date <- as.Date(data$Date, format="%d/%m/%Y") # reformating of date


data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date(" 2007-02-02")) # subsetting the data


## Plot 2

png(filename = "Plot2.png", # graphics device start
    width = 480, height = 480, units = "px") #size

plot(data2$Time, data2$Global_active_power,type="l", xlab="",ylab="") #plot inizialization
title(ylab="Global Active Power (kilowatts)") #annotation

dev.off() # Graphics device off
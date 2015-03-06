
## PLOT 4:  Multiplot, scatter

## data extraction and treatment

datadir <- "./household_power_consumption.txt"

data <- read.table(datadir,sep=";",
                   header = TRUE,
                   na.strings = "?",
                   colClasses = c(Date="character",Time="character",rep("numeric",7)))#data import

data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format="%d/%M/%Y %H:%M:%S") # reformating of date and time values
data$Date <- as.Date(data$Date, format="%d/%m/%Y") # reformating of date


data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date(" 2007-02-02")) # subsetting the data


## Plot 4


png(filename = "Plot4.png", # graphics device start
    width = 480, height = 480, units = "px") #size

par(mfrow = c(2,2)) #grid for all the graphs
with(data2, {
        
        #Plot topleft
        plot(data2$Time, data2$Global_active_power,type="l", xlab="",ylab="") #plot inizialization
        title(ylab="Global Active Power (kilowatts)") #annotation
        
        #plot topright
        plot(data2$Time, data2$Voltage,type="l", xlab="",ylab="") #plot inizialization
        title( xlab="datetime",ylab="Voltage") #annotation
        
        #plot bottomleft
        plot(data2$Time, data2$Sub_metering_1,type="l", xlab="",ylab="") #plot initialization
        lines(data2$Time, data2$Sub_metering_1, col="black") #line input1
        lines(data2$Time, data2$Sub_metering_2, col="red") #line input2
        lines(data2$Time, data2$Sub_metering_3, col="blue") #line input3
        legend(box.col=NA, "topright",lty=c(1,1,1), col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        title(ylab="Energy sub metering") #other annotation
        
        #plot bottomright
        plot(data2$Time, data2$Global_reactive_power,type="l", xlab="",ylab="") #plot inizialization
        title( xlab="datetime",ylab="Global_reactive_power") #annotation
        
})


dev.off() # Graphics device off

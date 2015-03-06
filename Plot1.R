
## PLOT 1 :  Global Active Power red histogram

## data extraction and treatment

datadir <- "./household_power_consumption.txt"

data <- read.table(datadir,sep=";",
                   header = TRUE,
                   na.strings = "?",
                   colClasses = c(Date="character",Time="character",rep("numeric",7)))#data import

data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format="%d/%M/%Y %H:%M:%S") # reformating of date and time values
data$Date <- as.Date(data$Date, format="%d/%m/%Y") # reformating of date


data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date(" 2007-02-02")) # subsetting the data


## Plot 1


png(filename = "Plot1.png", # graphics device start
    width = 480, height = 480, units = "px") #size

hist(data2$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     breaks=12,
     col=2)

dev.off() # Graphics device off
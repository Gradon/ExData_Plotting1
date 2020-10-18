## read data from household power consumption file
## only needs data from 2007-02-01 and 2007-02-02
## starts on 16/12/2006 17:24:00 and increments one per minute
## line 66638 starts 2007/02/01, line 69517 ends 2007/02/02

## read names from top of file
headernames <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?", nrows=1)

## read data for 02/01/2007 - 02/02/2007
powerdata <- read.table("./household_power_consumption.txt",sep = ";", header = FALSE, col.names = names(headernames), na.strings = "?", nrows=2880, skip = 66637)

## add a column for converted datetime
timestring <- "%d/%m/%Y %H:%M:%S"
powerdata <- mutate(powerdata, datetime = strptime(paste(testdata$Date, testdata$Time), timestring))

## set up png device
png(filename = "plot3.png", width = 480, height = 480)

## generate plot
plot(powerdata$datetime, powerdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(powerdata$datetime, powerdata$Sub_metering_1, col = "black")
lines(powerdata$datetime, powerdata$Sub_metering_2, col = "red")
lines(powerdata$datetime, powerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

## close device
dev.off()

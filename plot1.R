## read data from household power consumption file
## only needs data from 2007-02-01 and 2007-02-02
## starts on 16/12/2006 17:24:00 and increments one per minute
## line 66638 starts 2007/02/01, line 69517 ends 2007/02/02

## read names from top of file
headernames <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?", nrows=1)

## read data for 02/01/2007 - 02/02/2007
powerdata <- read.table("./household_power_consumption.txt",sep = ";", header = FALSE, col.names = names(headernames), na.strings = "?", nrows=2880, skip = 66637)

## set up png device
png(filename = "plot1.png", width = 480, height = 480)

## generate plot
hist(powerdata$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")

## close device
dev.off()

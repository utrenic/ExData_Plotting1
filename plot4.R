rm(list=ls())

setwd("/Users/kelvin/Coursera/myCopy/4.ExploratoryDataAnalysis/project1/")

# infile name
infile <- "household_power_consumption.txt"
# read table
dat <- read.csv(infile, header=TRUE, sep=';', na.string='?', stringsAsFactors = FALSE)

# convert dat$Date to Date class
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# subset the data 
dat <- subset(dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#dim(dat)
#[1] 2880    9

# converting dates
datetime <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(datetime)

# Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(dat, {
     # top left
     plot(Global_active_power ~ Datetime, type="l",
          ylab="Global Active Power", xlab="")
     # top right
     plot(Voltage ~ Datetime, type="l", 
          ylab="Voltage", xlab="")
     # lower left
     plot(Sub_metering_1  ~ Datetime, type='l', 
          ylab="Energy sub metering", xlab="")
     lines(Sub_metering_2 ~ Datetime, col="red")
     lines(Sub_metering_3 ~ Datetime, col="blue")
     # lower right
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ Datetime, type="l",
          ylab="Global Reactive Power", xlab="")
    })

# output the graph to a png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
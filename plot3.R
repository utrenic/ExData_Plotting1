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

# Plot3
png("plot3.png", width=480, height=480)
with(dat, {
     plot(dat$Sub_metering_1  ~ dat$Datetime, type='l', 
     ylab="Energy sub metering", xlab="")
     lines(dat$Sub_metering_2 ~ dat$Datetime, col="red")
     lines(dat$Sub_metering_3 ~ dat$Datetime, col="blue")
    })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
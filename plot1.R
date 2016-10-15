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

# Plot1
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, main="Global Active Power", 
    xlab='Global Active Power (killowatts)', ylab= "Frequency", col="Red")
dev.off()
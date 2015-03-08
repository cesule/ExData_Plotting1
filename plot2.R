# Exploratory Data Analysis
# Course Project 1

# Set working directory with setwd() same as the directory of the data
# Load the dataset into R

epc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
epc_subset <- epc[(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"), ]
epc_subset$datetime<-strptime(paste(epc_subset$Date,epc_subset$Time),"%d/%m/%Y %H:%M:%S")
str(epc_subset$datetime)

## Plot2 ##
# If you use the png() instead of dev.copy(), you don't need to specify the 480x480.
# The default is 480x480 already.
png(file = "plot2.png", bg = "transparent")
with(epc_subset, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

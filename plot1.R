# Exploratory Data Analysis
# Course Project 1

# Set working directory with setwd() same as the directory of the data
# Load the dataset into R

epc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
epc_subset <- epc[(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"), ]
epc_subset$datetime<-strptime(paste(epc_subset$Date,epc_subset$Time),"%d/%m/%Y %H:%M:%S")
str(epc_subset$datetime)

## Plot1 ##
# If you use the png() instead of dev.copy(), you don't need to specify the 480x480.
# The default is 480x480 already.
png(file = "plot1.png", bg = "transparent")
with(epc_subset, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()


# Exploratory Data Analysis
# Course Project 1

# Set working directory with setwd() same as the directory of the data
# Load the dataset into R

epc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
epc_subset <- epc[(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"), ]
epc_subset$datetime<-strptime(paste(epc_subset$Date,epc_subset$Time),"%d/%m/%Y %H:%M:%S")
str(epc_subset$datetime)

## Plot3 ##
# If you use the png() instead of dev.copy(), you don't need to specify the 480x480.
# The default is 480x480 already.
png(file = "plot3.png", bg = "transparent")
with(epc_subset, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(subset(epc_subset), points(datetime, Sub_metering_1, type="l", col="black"))
with(subset(epc_subset), points(datetime, Sub_metering_2, type="l", col="red"))
with(subset(epc_subset), points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

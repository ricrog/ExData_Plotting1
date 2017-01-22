## Download zip packages
if(!file.exists("Dataset.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile="./Dataset.zip")
        unzip("Dataset.zip")
}

## Read data and subset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Build plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Extracting needed variables
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
Global_active_power <- as.numeric(data$Global_active_power)
Global_reactive_power <- as.numeric(data$Global_reactive_power)
Voltage <- as.numeric(data$Voltage)
Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 1,1
plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
# Plot 1,2
plot(Date_Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Plot 2,1
plot(Date_Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(Date_Time, Sub_metering_2, col = "red")
lines(Date_Time, Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
# Plot 2,2
plot(Date_Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", bty = "n")
dev.off()


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
png("plot1.png", width=480, height=480)
Global_active_power <- as.numeric(data$Global_active_power)
hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
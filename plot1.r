library(data.table)
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


subplotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

subplotdata$Global_active_power <- as.numeric(as.character(subplotdata$Global_active_power))

hist(subplotdata$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main ="
     Global Active Power")
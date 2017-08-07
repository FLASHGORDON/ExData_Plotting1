library(data.table)
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


subplotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")
subplotdata$Date <- as.Date(subplotdata$Date, format = "%d/%m/%Y")
subplotdata$dat_time <- paste(subplotdata$Date, subplotdata$Time)

subplotdata$dat_time <- as.POSIXct(subplotdata$dat_time)
subplotdata$Voltage <- as.numeric(as.character(subplotdata$Voltage))
subplotdata$Global_reactive_power <- as.numeric(as.character(subplotdata$Global_reactive_power))
subplotdata$Global_active_power <- as.numeric(as.character(subplotdata$Global_active_power))

par(mfrow = c(2,2))

plot(subplotdata$dat_time, subplotdata$Global_active_power, xlab = "", ylab ="
     Global Active Power", type = "l")
plot(subplotdata$dat_time, subplotdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(subplotdata$dat_time, subplotdata$Sub_metering_1, col = "black", type = "l" ,ylab = "Energy sub metering", xlab = '')
lines(subplotdata$dat_time, subplotdata$Sub_metering_2, col = "red")
lines(subplotdata$dat_time, subplotdata$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.4,2.4), col = c('black','blue','red'),  bty = "n", cex=0.7)

plot(subplotdata$dat_time, subplotdata$Global_reactive_power, xlab = 'datetime', ylab= "
     Global_reactive_power" , type = "l")
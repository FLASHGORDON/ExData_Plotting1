
library(data.table)
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


subplotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")
subplotdata$Date <- as.Date(subplotdata$Date, format = "%d/%m/%Y")
subplotdata$dat_time <- paste(subplotdata$Date, subplotdata$Time)

subplotdata$dat_time <- as.POSIXct(subplotdata$dat_time)

plot(subplotdata$dat_time, subplotdata$Sub_metering_1, col = "black", type = "l" ,ylab = "Energy sub metering", xlab = '')
lines(subplotdata$dat_time, subplotdata$Sub_metering_2, col = "red")
lines(subplotdata$dat_time, subplotdata$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.4,2.4), col = c('black','blue','red'),  bty = "n", cex=0.7)
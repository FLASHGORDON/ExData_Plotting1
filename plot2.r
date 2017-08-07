library(data.table)
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


subplotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")
subplotdata$Date <- as.Date(subplotdata$Date, format = "%d/%m/%Y")
subplotdata$dat_time <- paste(subplotdata$Date, subplotdata$Time)

subplotdata$dat_time <- as.POSIXct(subplotdata$dat_time)
subplotdata$Global_active_power <- as.numeric(as.character(subplotdata$Global_active_power))

plot(subplotdata$dat_time, subplotdata$Global_active_power, type = 'l', xlab =""
      ,ylab = "Global active power (kilowatts)")
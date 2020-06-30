rm(list = ls()) # clean the workspace
dttemp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) #read data
dttemp$Date2 <- as.Date(strptime(dttemp$Date, "%d/%m/%Y")) # convert Date columns from Character to Date
dttemp$Datetime <- paste(dttemp$Date, dttemp$Time) # paste date and time together for plotting purposes later
dttemp$Datetime <- as.POSIXct(dttemp$Datetime, format="%d/%m/%Y %H:%M:%S")
dt <- dttemp[(dttemp$Date2 >= as.Date("2007-02-01") & dttemp$Date2 <= as.Date("2007-02-02")),] # select only required data (1st and 2nd Feb 2007)

dt$Global_active_power <- as.numeric(dt$Global_active_power) #transform GAP into numeric


png("plot4.png", width = 480, height = 480) # open graphic device
par(mfrow=c(2, 2)) # create a 4 quadrants plot
par(mfg = c(1,1)) # selects top left plot
plot(dt$Datetime, dt$Global_active_power, type = "l", ylab = "Global Active Power [kW]", xlab = "") # plot command
par(mfg = c(1,2)) # selects top right plot
plot(dt$Datetime, dt$Voltage, type = "l", ylab = "Voltage [V]", xlab = "") # plot command
par(mfg = c(2,1)) # selects bottom left plot
plot(dt$Datetime, dt$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") # plot command
lines(dt$Datetime, dt$Sub_metering_2, type = "l", col = "blue", xlab = "") # plot second line
lines(dt$Datetime, dt$Sub_metering_3, type = "l", col = "red", xlab = "") # plot third line
par(mfg = c(2,2)) # selects bottom right plot
plot(dt$Datetime, dt$Global_reactive_power, type = "l", ylab = "Global Reactive Power [kW]", xlab = "") # plot command
dev.off() # close graphic devide


rm(list = ls()) # clean the workspace
dttemp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) #read data
dttemp$Date2 <- as.Date(strptime(dttemp$Date, "%d/%m/%Y")) # convert Date columns from Character to Date
dttemp$Datetime <- paste(dttemp$Date, dttemp$Time) # paste date and time together for plotting purposes later
dttemp$Datetime <- as.POSIXct(dttemp$Datetime, format="%d/%m/%Y %H:%M:%S")
dt <- dttemp[(dttemp$Date2 >= as.Date("2007-02-01") & dttemp$Date2 <= as.Date("2007-02-02")),] # select only required data (1st and 2nd Feb 2007)

dt$Global_active_power <- as.numeric(dt$Global_active_power) #transform GAP into numeric


png("plot2.png", width = 480, height = 480) # open graphic devide
plot(dt$Datetime, dt$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") # plot command
dev.off() # close graphic devide

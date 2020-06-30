# rm(list = ls()) # clean the workspace
dttemp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) #read data
dttemp$Date <- as.Date(strptime(dttemp$Date, "%d/%m/%Y")) # convert Date columns from Character to Date
dt <- dttemp[(dttemp$Date >= as.Date("2007-02-01") & dttemp$Date <= as.Date("2007-02-02")),] # select only required data (1st and 2nd Feb 2007)

dt$Global_active_power <- as.numeric(dt$Global_active_power) # transform from char to numeric

png("plot1.png", width = 480, height = 480) # open graphic device
hist(dt$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power") # create hist plot
dev.off() # close graphic devide

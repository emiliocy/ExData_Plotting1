setwd("X:\\Dropbox\\Emilio\\Work\\Coursera\\ExploratoryAnalysis\\assignments\\exdata_data_household_power_consumption")
dt = read.table("household_power_consumption.txt", sep = ";", header=TRUE)
dt$date = as.Date(dt$Date, format = "%d/%m/%Y")
dt = dt[dt$date >= as.Date("2007-02-01") & dt$date <= as.Date("2007-02-02"),]

head(dt,10)
#Global_active_power
#Frequency
hist(dt$Global_active_power, col="red", main = "Global Active Power", 
     ylab = "Global Active Power (kilowatts)")
title("")
setwd("../..")
dev.copy(png, file="plot1.png" , h=480, w = 480)
dev.off()
#set working directory
setwd("X:\\Dropbox\\Emilio\\Work\\Coursera\\ExploratoryAnalysis\\assignments\\exdata_data_household_power_consumption")

#read data table
dt = read.table("household_power_consumption.txt", sep = ";", header=TRUE)

#reformat the dates for filtering
dt$date = as.Date(dt$Date, format = "%d/%m/%Y")

#filter dates bwtween 2007-02-01 & 2007-02-02
dt = dt[dt$date >= as.Date("2007-02-01") & dt$date <= as.Date("2007-02-02"),]

head(dt,10)
#Global_active_power
#Frequency

#draw histogram
hist(dt$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#set the historgram title
title("Global Active Power")

#change working directory
setwd("../..")

#copy the data to PNG file format with resolution settings of 480x480
dev.copy(png, file="plot1.png" , h=480, w = 480)

#save the file
dev.off()

#download and unzip dataset from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library("lubridate")

#set working directory
setwd("X:\\Dropbox\\Emilio\\Work\\Coursera\\ExploratoryAnalysis\\assignments\\exdata_data_household_power_consumption")

#read data table
dt = read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")

#reformat the dates for filtering
dt$date = as.Date(dt$Date, format = "%d/%m/%Y")

#filter dates bwtween 2007-02-01 & 2007-02-02
dt = dt[dt$date >= as.Date("2007-02-01") & dt$date <= as.Date("2007-02-02"),]

#format the dates to plot the day
dt$date   = dmy(dt$Date) + hms(dt$Time)

head(dt,10)
#Global_active_power
#Frequency

#draw histogram
plot(dt$date, dt$Global_active_power ,xlab="",  ylab = "Global Active Power (kilowatts)", type="l")

#set the historgram title
title("")

#change working directory
setwd("../..")

#copy the data to PNG file format with resolution settings of 480x480
dev.copy(png, file="plot2.png" , h=480, w = 480)

#save the file
dev.off()

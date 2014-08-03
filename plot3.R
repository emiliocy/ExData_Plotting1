library("lubridate")

#download and unzip dataset from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

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
#Sub_metering_1
#Sub_metering_2
#Sub_metering_3

#draw histogram
#par(mar=c(4,4,1,1))

#create empty base plot
with(dt, plot(dt$date, Sub_metering_1, type="n", xlab="",  ylab ="Energy sub metering"))
#add series1
points(dt$date, dt$Sub_metering_1, col="black", type="l")
#add series2
points(dt$date, dt$Sub_metering_2, col="red", type="l")
#add series3
points(dt$date, dt$Sub_metering_3, col="blue", type="l")
#add legend
legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), , text.width=58400 )

#set the historgram title
title("")

#change working directory
setwd("../..")

#copy the data to PNG file format with resolution settings of 480x480
dev.copy(png, file="plot3.png" , h=480, w = 480, units = "px")

#save the file
dev.off()

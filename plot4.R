#download and unzip dataset from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library("lubridate")

#set working directory
setwd("X:\\Dropbox\\Emilio\\Work\\Coursera\\ExploratoryAnalysis\\assignments\\exdata_data_household_power_consumption")

#read data table
dt = read.table("household_power_consumption.txt", sep = ";", header=TRUE)

#reformat the dates for filtering
dt$date = as.Date(dt$Date, format = "%d/%m/%Y")

#filter dates bwtween 2007-02-01 & 2007-02-02
dt = dt[dt$date >= as.Date("2007-02-01") & dt$date <= as.Date("2007-02-02"),]

#format the dates to plot the day
dt$date   = dmy(dt$Date) + hms(dt$Time)

dt$global_active_power = dt$Global_active_power

head(dt,10)

#change working directory
setwd("../..")

png(filename = "plot4.png", width=480,height=480)

  #set histogram positions
  par(mfrow = c(2, 2),mar = c(4,4,2,1), oma = c(0,0,2,0))

  #draw histogram
  #Global_active_power
  plot(dt$date, dt$Global_active_power, xlab="", ylab = "Global Active Power", type="l", col="black")
  
  #draw histogram
  #Voltage
  plot(dt$date, dt$Voltage,  ylab ="Voltage", xlab="datetime",  type="l", col="black")
  
  #draw histogram
  #Energy sub metering
  #create empty base plot
  plot(dt$date, dt$Sub_metering_1, type="n", xlab="",  ylab ="Energy sub metering")
  #add series1
  points(dt$date, dt$Sub_metering_1, col="black", type="l")
  #add series2
  points(dt$date, dt$Sub_metering_2, col="red", type="l")
  #add series3
  points(dt$date, dt$Sub_metering_3, col="blue", type="l")
  #add legend
  legend("topright", bty="n", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width=78400 )
  
  #draw histogram
  #Voltage
  plot(dt$date, dt$Global_reactive_power, type="l",  ylab ="Global_reactive_power", xlab="datetime")


#save the file
dev.off()

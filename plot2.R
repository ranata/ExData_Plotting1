if (!require(sqldf))
  install.packages("sqldf")
library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, mySql, header = TRUE, sep = ";")
myData$DateTime <- strptime(paste(myData$Date,myData$Time),format="%d/%m/%Y %H:%M:%S")

plot(myData$DateTime, myData$Global_active_power, type="l", xlab="",  ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()



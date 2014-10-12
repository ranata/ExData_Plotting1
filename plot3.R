if (!require(sqldf))
  install.packages("sqldf")
library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, mySql, header = TRUE, sep = ";")
myData$DateTime <- strptime(paste(myData$Date,myData$Time),format="%d/%m/%Y %H:%M:%S")

# Plotting sub-meter 1
plot(myData$DateTime, myData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

# Plotting sub-meter 2
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")

# Plotting sub-meter 3
lines(myData$DateTime, myData$Sub_metering_3, type="l",col="blue")

# Adding legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))

dev.copy(png, file="plot3.png", width=480, height=480)

dev.off()



if (!require(sqldf))
  install.packages("sqldf")
library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, mySql, header = TRUE, sep = ";")

hist(myData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = 2, main =  "Global Active Power")

dev.copy(png, file="plot1.png", width=480, height=480)

dev.off()



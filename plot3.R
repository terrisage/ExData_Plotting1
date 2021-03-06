## Assume dataset is in current working directory
## Read in entire dataset
powerData <- read.table("household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        colClasses=c("character", "character", rep("numeric",7)),
                        na="?")

# convert date and time variables to Date/Time class
powerData$Time <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

# Subset to only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
powerData <- subset(powerData, Date %in% dates)

## Plot 3
with(powerData, {
  plot(Time, Sub_metering_1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Time, Sub_metering_2,col='Red')
  lines(Time, Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

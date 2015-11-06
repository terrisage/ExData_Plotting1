## This assignment uses data from the UC Irvine Machine Learning Repository, a popular 
## repository for machine learning datasets.
## Assume dataset is in current working directory
## Read in entire dataset
powerData <- read.table("household_power_consumption.txt", header=TRUE,sep=";",
    colClasses=c("character", "character", rep("numeric",7)), na="?")

# Convert date and time variables to Date/Time class
# Using strptime and as.Date() functions
powerData$Time <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

# Subset to only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
powerData <- subset(powerData, Date %in% dates)

## Plot 1
hist(powerData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

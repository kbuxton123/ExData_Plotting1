# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot3
################################################################################
# Load the data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 

# Plot 3
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

# Save data
dev.copy(png, "plot3.png")
dev.off()


# globalActivePower <- as.numeric(subSetData$Global_active_power)
# subMetering1 <- as.numeric(subSetData$Sub_metering_1)
# subMetering2 <- as.numeric(subSetData$Sub_metering_2)
# subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# 
# # Plot 3
# plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# lines(datetime, subMetering2, type="l", col="red")
# lines(datetime, subMetering3, type="l", col="blue")
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# 
# # Save file
# dev.copy(png, file = "plot3.png", height = 480, width = 480)
# dev.off()
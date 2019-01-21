# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot2
################################################################################
# Load the data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?")

# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Plot 2
with(subSetData, plot(datetime, globalActivePower, type="l", xlab="", 
                      ylab="Global Active Power (kilowatts)"))

# Save file
dev.copy(png, "Plot2.png", height = 480, width = 480)
dev.off()

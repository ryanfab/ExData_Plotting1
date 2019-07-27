## Exploratory Data Analysis Project 1

# load libraries
library(dplyr)

# Import Data
Data <- read.table("./Exploratory_Data_Analysis/household_power_consumption.txt",
                   sep = ";", header = TRUE, stringsAsFactors = F)

# Subset Data
feb_data <- Data %>%
        filter(Date %in% c("1/2/2007", "2/2/2007"))

# combine Date and Time column
datetime <- strptime(paste(feb_data$Date, feb_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Open file
png("plot3.png", height = 480, width = 480)

# plot
plot(datetime, feb_data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(datetime, feb_data$Sub_metering_1, type = "l")
points(datetime, feb_data$Sub_metering_2, type = "l", col = "red")
points(datetime, feb_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                              lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# Close file
dev.off()

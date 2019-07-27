### Exploratory Data Analysis Project 1

# load libraries
library(dplyr)

Data <- read.table("./Exploratory_Data_Analysis/household_power_consumption.txt",
                   sep = ";", header = TRUE, stringsAsFactors = F)
        
# Subset Data
feb_data <- Data %>%
        filter(Date %in% c("1/2/2007", "2/2/2007"))

# combine Date and Time column
datetime <- strptime(paste(feb_data$Date, feb_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Open file
png("plot2.png", width = 480, height = 480)

# plot
plot(datetime, as.numeric(feb_data$Global_active_power),
                    ylab = "Global Active Power (kilowatts)", type = "l")

# Save plot
dev.off()

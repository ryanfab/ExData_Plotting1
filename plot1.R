## Exploratory Data Analysis Project 1

# load library
library(dplyr)

# Import Data
Data <- read.table("./Exploratory_Data_Analysis/household_power_consumption.txt",
                   sep = ";", header = TRUE, stringsAsFactors = F)

# Change Date class from factor to date
Data <- Data %>% 
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

# Subset Data
feb_data <- Data %>%
        filter(Date >= "2007-2-1", Date <= "2007-2-2")

# Open file
png("plot1.png", height = 480, width = 480)

# plot
with(feb_data, hist(as.numeric(Global_active_power), col = "red",
                        xlab = "Global Active Power (kilowatts)",
                        ylab = "Frequency", 
                        main = "Global Active Power"))
# Save plot
dev.off()

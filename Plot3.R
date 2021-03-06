##Raw data and Plot1.R file should be in the working directory.
##

## loading needed lybraies
library(readr)
library(dplyr)
library(lubridate)

## Reading the data
hpc <- read_delim("~/ExData_Plotting1/household_power_consumption.txt",";", 
                  escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                                          Time = col_time(format = "%T")), trim_ws = TRUE, na ="?")

## Filtering the two days of interes and finding out day of the week
hpc_0102 <- hpc %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
##Creating a column combining Date and Time
hpc_0102$DateTime <- hpc_0102$Date + hms(hpc_0102$Time)

##oppening the device png and plotting, clossing the device
png(height = 480,width = 480, filename = "./Plot3.png")
hpc_0102 %>% with(plot(DateTime,Sub_metering_1, type = "l", 
                       ##col="red"
                       ##main = "Global Avtive Power",
                       xlab = "",
                       ylab = "Energy sub metering"))
hpc_0102 %>% with(lines(DateTime,Sub_metering_2, type = "l", col ="red"))
hpc_0102 %>% with(lines(DateTime,Sub_metering_3, type = "l", col ="blue"))

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)

dev.off()


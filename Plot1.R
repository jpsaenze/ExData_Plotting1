##Raw data and Plot1.R file should be in the working directory.
##

## loading needed lybraies
library(readr)
library(dplyr)



## Reading the data
hpc <- read_delim("~/ExData_Plotting1/household_power_consumption.txt",";", 
                  escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                  Time = col_time(format = "%T")), trim_ws = TRUE, na ="?")

## Filtering the two days of interes
hpc_0102 <- hpc %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

##oppening the device png and plotting, clossing the device
png(height = 480,width = 480, filename = "./Plot1.png")
hpc_0102 %>% with(hist(Global_active_power, 
                       col="red",
                       main = "Global Avtive Power",
                       xlab = "Global Active Power (kilowatts)"))
dev.off()

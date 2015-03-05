#load required libraries
library(lubridate)
library(dplyr)
#Download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip", "curl")
unzip("power.zip")

#Read rows which correspond to 1-2 February
data <- read.csv("household_power_consumption.txt", 
                 nrows = 2880, 
                 na.strings = "?", 
                 sep = ";", 
                 skip = 66636,
                 col.names = c("date", "time", "global.active.power", "global.reactive.power", "voltage", "global_intensity", "sub.metering.1", "sub.metering.2", "sub.metering.3")
)
#Get columns which we need for plotting: date, time and Global active power 
#and then add one new column "combine" with date and time together. I use dplyr package.
data <- data %>% 
        select(date, time, global.active.power) %>% 
        mutate(combine = paste(date, time, " "))
#Convert combine column to date format with lubridate package
data$combine <- dmy_hms(data$combine)

#Start graphic device png. Picture will be 480x480 by default.
png("plot2.png")

#Create the plot 
plot(data$combine, data$global.active.power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = " "
     )

#Close all grafics devices 
dev.off()

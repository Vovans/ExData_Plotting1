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

#Start graphic device png. Picture will be 480x480 by default.
png("plot1.png")

#Create the histogram
hist(data$global.active.power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

#Close all grafics devices 
dev.off()
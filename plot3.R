#plot 3

elec <- read.csv("household_power_consumption.txt", header = T,
                 sep =";")
elec_data <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")
library(dplyr)
library(ggplot2)
library(data.table)
elec_data$Global_active_power <- as.numeric(elec_data$Global_active_power)
elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(elec_data$Date), elec_data$Time)
elec_data$Datetime <- as.POSIXct(datetime)

png(filename = "plot3.png",
    width = 480, height = 480)

with(elec_data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')

})

dev.off()

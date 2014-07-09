##reading the data, setting all variables as characters, and going to specific rows
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", colClasses="character",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
##getting rid of question marks in data
data[power == "?"] = NA
##making power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
##making a png file to place the upcoming plot on and setting pixels
png(file="plot4.png",width=480,height=480)
##combining date and time
data$DateTime = (paste(data$Date, data$Time))
data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))  ##set up canvas
## plotting the data for plot 1
plot(data$DateTime,
     data$Global_active_power,
     pch=NA,
     xlab="",
     ylab="Global Active Power (kilowatts)")


# adding lines for plot 1
lines(data$DateTime, data$Global_active_power)




## plotting plot 2
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)


# adding lines for plot 2
lines(data$DateTime, data$Voltage)


## plotting plot 3
plot(data$DateTime,
     data$Sub_metering_1,
     pch=NA,
     xlab="",
     ylab="Energy sub metering")


# adding lines for plot 3
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')


# legend for plot 3
legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')


# plotting plot 4
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))


# telling 4 were done with the png file
dev.off()

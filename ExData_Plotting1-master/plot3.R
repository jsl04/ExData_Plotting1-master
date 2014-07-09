##reading the data, setting all variables as characters, and going to specific rows
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", colClasses="character",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
##getting rid of question marks in data
data[power == "?"] = NA
##making power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
##making a png file to place the upcoming plot on and setting pixels
png(file="plot3.png",width=480,height=480)
##combining date and time
data$DateTime = (paste(data$Date, data$Time))
data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(1,1))  ##set up canvas
plot(data$DateTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")

##adding the different measures or lines in the graph
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col= "red")
lines(data$DateTime, data$Sub_metering_3, col= "blue")
##creating the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black","red", "blue"))
##telling R were done with the PNG file
dev.off()

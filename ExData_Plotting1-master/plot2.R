##reading the data, setting all variables as characters, and going to specific rows
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
sep = ";", colClasses="character",col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
##getting rid of question marks in data
data[power == "?"] = NA
##making power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
##making a png file to place the upcoming plot on and setting pixels
png(file="plot2.png",width=480,height=480)
##combining date and time
data$DateTime = (paste(data$Date, data$Time))
data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
##plotting the data
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
##telling R that were done with the png file
dev.off()

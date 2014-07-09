##reading the data, setting all variables as characters, and going to specific rows
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                    sep = ";", colClasses="character",
                    col.names = colnames(read.table("household_power_consumption.txt",
                                                    nrow = 1, header = TRUE, sep=";")))

##getting rid of question marks in data
data[power == "?"] = NA
##making power as numeric
data$Global_active_power = as.numeric(as.character(power$Global_active_power))
##making a png file to place the upcoming plot on and setting pixels
png(file="plot1.png",width=480,height=480)
##plotting the data
hist(power$Global_active_power, col = "red", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power ")
##telling R that were done with the png file
dev.off()

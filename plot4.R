## Set the working directory and upload the file to data.frame

setwd("C:/Users/Mohamed/Desktop/Exploratory data")
Week1_Project_dataFile <- "household_power_consumption.txt"
Project_data_frame <- read.table(Week1_Project_dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Convert the Global_active _power column from char to numeric for plotting 
Project_data_frame$Global_active_power<-as.numeric(Project_data_frame$Global_active_power)

##Filter the data of the required dates to a subset
Project_data_subset <- Project_data_frame[Project_data_frame$Date %in% c("1/2/2007","2/2/2007") ,]

##Create the Vectors for plotting
datetime <- strptime(paste(Project_data_subset$Date, Project_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower<-Project_data_subset$Global_active_power
globalReactivePower <- as.numeric(Project_data_subset$Global_reactive_power)
voltage <- as.numeric(Project_data_subset$Voltage)

subMetering1 <- as.numeric(Project_data_subset$Sub_metering_1)
subMetering2 <- as.numeric(Project_data_subset$Sub_metering_2)
subMetering3 <- as.numeric(Project_data_subset$Sub_metering_3)


##Plot as per the required parameters

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()



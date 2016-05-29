## Set the working directory and upload the file to data.frame

setwd("C:/Users/Mohamed/Desktop/Exploratory data")
Week1_Project_dataFile <- "household_power_consumption.txt"
Project_data_frame <- read.table(Week1_Project_dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Convert the Global_active _power column from char to numeric for plotting 
Project_data_frame$Global_active_power<-as.numeric(Project_data_frame$Global_active_power)

##Filter the data of the required dates to a subset
Project_data_subset <- Project_data_frame[Project_data_frame$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot the Hisytogram as per the required parameters
png("plot1.png", width=480, height=480)
hist(Project_data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
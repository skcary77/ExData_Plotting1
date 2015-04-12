temp <- tempfile()
#dowload the zip the the temp file
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#read in the data by unzipping the file
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",stringsAsFactors=FALSE)
#delete the temp file
unlink(temp)

#format the date column
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
#keep only the dates we are interested in
data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
#format the Time column to be the date and time
data$Time <- strptime(paste(data$Date,data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
#format the columns
#data[,-(1:2)] <- as.numeric(data[,-(1:2)]) #could not get this to work
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,6] <- as.numeric(data[,6])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])

#create the plot
png("plot1.png")
hist(data$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global active power (kilowatts)")
dev.off()


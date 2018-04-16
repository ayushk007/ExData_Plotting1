dataset <- read.csv("household_power_consumption.txt",sep = ";")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
data <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ,]
data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")
png('plot2.png',width = 480, height = 480)
plot(data$Time,as.numeric(data$Global_active_power),type = "l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
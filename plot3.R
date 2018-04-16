dataset <- read.csv("household_power_consumption.txt",sep = ";")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
data <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ,]
data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")
png('plot3.png',width = 480, height = 480)
plot(data$Time,as.numeric(data$Sub_metering_1),type="l",ylab="Energy Submetering", xlab="")
lines(data$Time,as.numeric(data$Sub_metering_2),type="l",col="red")
lines(data$Time,as.numeric(data$Sub_metering_3),type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
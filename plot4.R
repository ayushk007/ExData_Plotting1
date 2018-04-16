dataset <- read.csv("household_power_consumption.txt",sep = ";")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
data <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ,]
data$Time <- strptime(paste(data$Date,data$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data$Time, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data$Time, as.numeric(data$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(data$Time,as.numeric(data$Sub_metering_1),type="l",ylab="Energy Submetering", xlab="")
lines(data$Time,as.numeric(data$Sub_metering_2),type="l",col="red")
lines(data$Time,as.numeric(data$Sub_metering_3),type="l",col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data$Time, as.numeric(data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
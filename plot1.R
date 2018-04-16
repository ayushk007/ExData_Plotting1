dataset <- read.csv("household_power_consumption.txt",sep = ";")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
data <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ,]
data1 <- as.numeric(as.character(data$Global_active_power))
png('plot1.png',width = 480, height = 480)
hist(data1,col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
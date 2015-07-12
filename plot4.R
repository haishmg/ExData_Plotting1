data <- read.table("/Users/hganeshmurthy/Downloads/household_power_consumption.txt", sep=";", header=TRUE, colClasses= character())
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
library(datasets)
data2$Global_active_power <- as.numeric(paste(data2$Global_active_power))
data2$Voltage <- as.numeric(paste(data2$Voltage))
data2$Global_reactive_power <- as.numeric(paste(data2$Global_reactive_power))

png(filename = "plot4.png", width = 480, height = 480)

data2$Date <-  as.Date(data2$Date, format="%d/%m/%Y")
attach(data2)
par(mfrow=c(2,2))

plot(data2$Global_active_power, type ="l", ylab ="Global Active Power (kilowatts)" , xlab=" ", xaxt="n")
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))

plot(as.numeric(data2$Voltage),type ="l", ylab ="Voltage" , xlab="datetime", xaxt="n")
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))

plot(as.numeric(paste(data2$Sub_metering_1)), type="l", ylab= "Energy sub metering",xlab=" ", xaxt="n")
#axis(2,at =c(1,10,20,30), labels = c("0","10","20","30"))
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))
lines(as.numeric(paste(data2$Sub_metering_2)), col="red")
lines(as.numeric(paste(data2$Sub_metering_3)), col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1),bty="n", cex=0.7)
plot(data2$Global_reactive_power, type ="l", ylab ="Global Reactive Power" , xlab="datetime", xaxt="n")
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))

dev.off()


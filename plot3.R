data <- read.table("/Users/hganeshmurthy/Downloads/household_power_consumption.txt", sep=";", header=TRUE, colClasses= character())
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
library(datasets)
png(filename = "plot3.png", width = 480, height = 480)
plot(as.numeric(paste(data2$Sub_metering_1)), type="l", ylab= "Energy sub metering",xlab=" ", xaxt="n")
#axis(2,at =c(1,10,20,30), labels = c("0","10","20","30"))
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))
lines(as.numeric(paste(data2$Sub_metering_2)), col="red")
lines(as.numeric(paste(data2$Sub_metering_3)), col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1), cex=0.7)

dev.off()
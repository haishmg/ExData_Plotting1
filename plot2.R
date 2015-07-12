data <- read.table("/Users/hganeshmurthy/Downloads/household_power_consumption.txt", sep=";", header=TRUE, colClasses= character())
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
library(datasets)
data2$Global_active_power <- as.numeric(paste(data2$Global_active_power))
data2$Date <-  as.Date(data2$Date, format="%d/%m/%Y")
png(filename = "plot2.png", width = 480, height = 480)
plot(data2$Global_active_power, type ="l", ylab ="Global Active Power (kilowatts)" , xlab=" ", xaxt="n")
axis(1,at =c(1,1440,2881), labels = c("Thu","Fri","Sat"))

dev.off()
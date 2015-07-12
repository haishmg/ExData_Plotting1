data <- read.table("/Users/hganeshmurthy/Downloads/household_power_consumption.txt", sep=";", header=TRUE, colClasses= character())
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
library(datasets)
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data2$Global_active_power)/500, main = "Global Active Power", freq = 200, col="red" , xlab  ="Global Active Power (kilowatts)")
dev.off()
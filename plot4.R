consumption <- read.csv("household_power_consumption.txt", sep=";")
library(lubridate)
sub.con<-subset(consumption, Date=="1/2/2007"| Date=="2/2/2007")
sub.con$Date2<- dmy_hms(paste(sub.con$Date, sub.con$Time))
sub.con$Global_active_power<- as.numeric(as.character(sub.con$Global_active_power))
sub.con$Sub_metering_1<- as.numeric(as.character(sub.con$Sub_metering_1))
sub.con$Sub_metering_2<- as.numeric(as.character(sub.con$Sub_metering_2))
sub.con$Sub_metering_3<- as.numeric(as.character(sub.con$Sub_metering_3))
sub.con$Voltage<- as.numeric(as.character(sub.con$Voltage))
sub.con$Global_reactive_power<- as.numeric(as.character(sub.con$Global_reactive_power))

quartz()

par(mfrow=c(2,2))

plot(sub.con$Date2, sub.con$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(sub.con$Date2, sub.con$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(sub.con$Date2, sub.con$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(sub.con$Date2, sub.con$Sub_metering_2, type="l", col="red")
lines(sub.con$Date2, sub.con$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.col = "white")

plot(sub.con$Date2, sub.con$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


quartz.save("plot4.png", type="png", device=dev.cur(), canvas="white")
dev.off
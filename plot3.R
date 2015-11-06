consumption <- read.csv("household_power_consumption.txt", sep=";")

sub.con<-subset(consumption, Date=="1/2/2007"| Date=="2/2/2007")
sub.con$Date2<- dmy_hms(paste(sub.con$Date, sub.con$Time))
sub.con$Sub_metering_1<- as.numeric(as.character(sub.con$Sub_metering_1))
sub.con$Sub_metering_2<- as.numeric(as.character(sub.con$Sub_metering_2))
sub.con$Sub_metering_3<- as.numeric(as.character(sub.con$Sub_metering_3))


plot(sub.con$Date2, sub.con$Sub_metering_1, type="l", col="black")
lines(sub.con$Date2, sub.con$Sub_metering_2, type="l", col="red")
lines(sub.con$Date2, sub.con$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
consumption <- read.csv("household_power_consumption.txt", sep=";")

sub.con<-subset(consumption, Date=="1/2/2007"| Date=="2/2/2007")
sub.con$Global_active_power<- as.numeric(as.character(sub.con$Global_active_power))
sub.con$Date2<- dmy_hms(paste(sub.con$Date, sub.con$Time))
plot(sub.con$Date2, sub.con$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

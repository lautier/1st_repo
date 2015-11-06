
consumption <- read.csv("household_power_consumption.txt", sep=";")

sub.con<-subset(consumption, Date=="1/2/2007"| Date=="2/2/2007")
sub.con$Global_active_power<- as.numeric(as.character(sub.con$Global_active_power))

hist(dd$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Loading the data
Power <- read.table("household_power_consumption.txt", header=TRUE , na.string="?", sep=";")


# Subsetting the data and only using the dates 2007-02-01 and 2007-02-02
Power$Time <- strptime(paste(Power$Date, Power$Time, sep=", "), 
                       format = "%d/%m/%Y, %H:%M:%S")
Power$Date<-as.Date(Power$Date, format="%d/%m/%Y")
PowerSubset<-Power[(Power$Date=="2007-02-01")|(Power$Date=="2007-02-02"),]


#Plot 3

png(file="plot3.png",width=480, height=480)

with(PowerSubset, {
  plot(Time, Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
  lines(Time, Sub_metering_1, col="black")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
}
)
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),
       col=c("black","red","blue"))

dev.off()

# Loading the data
Power <- read.table("household_power_consumption.txt", header=TRUE , na.string="?", sep=";")


# Subsetting the data and only using the dates 2007-02-01 and 2007-02-02
Power$Time <- strptime(paste(Power$Date, Power$Time, sep=", "), 
                       format = "%d/%m/%Y, %H:%M:%S")
Power$Date<-as.Date(Power$Date, format="%d/%m/%Y")
PowerSubset<-Power[(Power$Date=="2007-02-01")|(Power$Date=="2007-02-02"),]


#Plot 1

png(file="plot1.png",width=480, height=480)

hist(PowerSubset$Global_active_power[!is.na(PowerSubset$Global_active_power)],
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()







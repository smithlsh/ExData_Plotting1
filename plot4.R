# Read file, assuming file is in the current working directory
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

# Do some data conversions
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)

# Pick out the relvant dates over which we will compute the plot 
subData<-data[data$Date>=as.Date("2007-02-01") &data$Date<=as.Date("2007-02-02"),]

# Plot and save graph as png file
png(filename="plot4.png",width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(subData$Global_active_power, type="l", xlab="",xaxt="n",ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(subData)/2), nrow(subData)), labels=c("Thu", "Fri", "Sat"))

plot(subData$Voltage, type="l", xlab="datetime",xaxt="n",ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(subData)/2), nrow(subData)), labels=c("Thu", "Fri", "Sat"))

plot(subData$Sub_metering_1, type="l",col="black",xlab="",xaxt="n",ylab="Energy sub metering")
axis(1, at=c(1, as.integer(nrow(subData)/2), nrow(subData)), labels=c("Thu", "Fri", "Sat"))
lines(subData$Sub_metering_2,col="red")
lines(subData$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1, col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subData$Global_reactive_power, type="l", xlab="datetime",xaxt="n",ylab="Global Reactive Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(subData)/2), nrow(subData)), labels=c("Thu", "Fri", "Sat"))
dev.off()


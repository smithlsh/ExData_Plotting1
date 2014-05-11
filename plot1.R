# Read file, assuming file is in the current working directory
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

# Do some date conversions
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)

# Pick out the relvant dates over which we will compute the hisgtogram
subData<-data[data$Date>=as.Date("2007-02-01") &data$Date<=as.Date("2007-02-02"),]

# Plot and dave graph as png file
png(filename="plot1.png", width=480, height=480, units="px")
hist(subData$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


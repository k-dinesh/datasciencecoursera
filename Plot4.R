
#Read file
powerconsumption<-read.table(file="household_power_consumption.txt", header = TRUE,sep=";",na.strings = "?",comment.char = "",colClasses = c("character","character",rep("numeric",7)))

#Massage data and subset
powerconsumption[[1]]<-as.Date(powerconsumption[[1]],"%d/%m/%Y")
powerconsumptionsubset<-subset(powerconsumption, Date >= "2007-02-01" & Date <="2007-02-02")
powerconsumptionsubset<- within(powerconsumptionsubset,{datetime=format(as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")})
powerconsumptionsubset$datetime <- strptime(powerconsumptionsubset$datetime,format="%d/%m/%Y %H:%M:%S")

#Open PNG file and plot
png(filename = "Plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

#Plot top left
plot(powerconsumptionsubset$datetime,powerconsumptionsubset$Global_active_power,type="l",xlab="",ylab="Global Active Power",main = "")

#Plot top right
plot(powerconsumptionsubset$datetime,powerconsumptionsubset$Voltage,type="l",xlab="datetime",ylab="Voltage",main = "")

#Plot bottom left
with(powerconsumptionsubset, plot(powerconsumptionsubset$datetime,powerconsumptionsubset$Sub_metering_1 ,type="l",xlab="",ylab="Energy sub metering",main = ""))
lines(powerconsumptionsubset$datetime,powerconsumptionsubset$Sub_metering_2,col="red")
lines(powerconsumptionsubset$datetime,powerconsumptionsubset$Sub_metering_3,col="blue")
legend("topright",bty = "n", lty = c(1,1,1), lwd = c(2,2,2),
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot bottom right
plot(powerconsumptionsubset$datetime,powerconsumptionsubset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",main = "")

dev.off()
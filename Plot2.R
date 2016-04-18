
#Read file
powerconsumption<-read.table(file="household_power_consumption.txt", header = TRUE,sep=";",na.strings = "?",comment.char = "",colClasses = c("character","character",rep("numeric",7)))

#Massage data and subset
powerconsumption[[1]]<-as.Date(powerconsumption[[1]],"%d/%m/%Y")
powerconsumptionsubset<-subset(powerconsumption, Date >= "2007-02-01" & Date <="2007-02-02")
powerconsumptionsubset<- within(powerconsumptionsubset,{datetime=format(as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")})
powerconsumptionsubset$datetime <- strptime(powerconsumptionsubset$datetime,format="%d/%m/%Y %H:%M:%S")

#open PNG file and plot chart
png(filename = "Plot2.png",width = 480, height = 480)
plot(powerconsumptionsubset$datetime,powerconsumptionsubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main = "")
dev.off()
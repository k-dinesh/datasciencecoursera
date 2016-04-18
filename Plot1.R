#Read file
powerconsumption<-read.table(file="household_power_consumption.txt", header = TRUE,sep=";",na.strings = "?",comment.char = "",colClasses = c("character","character",rep("numeric",7)))

#Massage data and subset
powerconsumption[[1]]<-as.Date(powerconsumption[[1]],"%d/%m/%Y")
powerconsumptionsubset<-subset(powerconsumption, Date >= "2007-02-01" & Date <="2007-02-02")

#Open PNG file and plot chart
png(filename = "Plot1.png",width = 480, height = 480)
hist(powerconsumptionsubset$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
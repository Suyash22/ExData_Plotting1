##Read the original data
data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##Change the date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

##Subset the data for the two days
data<-subset(data,Date>="2007-02-01"&Date<="2007-02-02")

##Converting dates
datetime<-paste(as.Date(data$Date),data$Time)
data$Datetime<-as.POSIXct(datetime)

##Plot 4

par(mfrow=c(2,2))
plot(data$Datetime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(data$Datetime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

with(data,{
plot(data$Sub_metering_1~data$Datetime,xlab="",ylab="Energy sub metering",type="l")
lines(data$Sub_metering_2~data$Datetime,col="red")
lines(data$Sub_metering_3~data$Datetime,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,col=c("black","red","blue"),lty=1,bty="n")
})

plot(data$Datetime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

##Copy the plot to a png file
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()

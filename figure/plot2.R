##Read the original data
data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##Change the date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

##Subset the data for the two days
data<-subset(data,Date>="2007-02-01"&Date<="2007-02-02")

##Converting dates
datetime<-paste(as.Date(data$Date),data$Time)
data$Datetime<-as.POSIXct(datetime)

##Plot 2
plot(data$Global_active_power~data$Datetime,xlab="",ylab="Global Active Power(kilowatts)",type="l")

##Copy the plot to a png file
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

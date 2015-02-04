##Read the original data
data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##Change the date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

##Subset the data for the two days
data<-subset(data,Date>="2007-02-01"&Date<="2007-02-02")

##Plot the histogram (plot1)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylab="Frequency",col="red")

##Copy the plot to a png file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

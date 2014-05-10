# plot3.r

# set working directory on local drive
setwd("~/Dropbox/Coursera/Exploratory Data Analysis/Project 1")

data = read.table("household_power_consumption.txt",header = TRUE,sep = ";",as.is = TRUE)

# subset data to the two days of interest
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]   # dates in file are in d/m/yyyy format

#convert Date/Time strings to single Posixlt date/time type
data$DateTime = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S");

#set the png device
png(file="plot3.png")

#plot the data 
par(mar = c(4,5,4,5),fg = "black")
#par(fg = "black")

plot(data$DateTime,as.numeric(data$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering",yaxt = "n",ylim=c(0,40))
lines(data$DateTime,as.numeric(data$Sub_metering_2),col="red")
lines(data$DateTime,as.numeric(data$Sub_metering_3),col="blue")

axis(side=2,at=seq(0,30,10),labels=seq(0,30,10))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,lty=c(1,1,1))

#close png output device
dev.off()

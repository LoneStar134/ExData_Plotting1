# plot1.r

# set working directory on local drive
setwd("~/Dropbox/Coursera/Exploratory Data Analysis/Project 1")

data = read.table("household_power_consumption.txt",header = TRUE,sep = ";",as.is = TRUE)

# subset data to the two days of interest
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]   # dates in file are in d/m/yyyy format

#convert Date/Time strings to single Posixlt date/time type
data$DateTime = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S");

#set the png device
png(file="plot1.png")

#plot the data 
#par(mar = c(4,6,2,2))

hist(as.numeric(data$Global_active_power),breaks = 12,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",xaxt='n',yaxt="n",xlim=c(0,6),ylim=c(0,1200))

axis(side=1,at=seq(0,6,2))
axis(side=2,at=seq(0,1200,200))

#output current device to PDF
dev.off()

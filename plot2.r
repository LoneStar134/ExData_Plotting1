# plot2.r

# set working directory on local drive
setwd("~/Dropbox/Coursera/Exploratory Data Analysis/Project 1")

data = read.table("household_power_consumption.txt",header = TRUE,sep = ";",as.is = TRUE)

# subset data to the two days of interest
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]   # dates in file are in d/m/yyyy format

#convert Date/Time strings to single Posixlt date/time type
data$DateTime = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S");

#set the png device
png(file="plot2.png")

#plot the data 
#par(mar = c(4,6,2,2),fg = "black")
#par(fg = "black")

plot(data$DateTime,as.numeric(data$Global_active_power),type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)",yaxt = "n",ylim=c(0,8))

axis(side=2,at=c(0,2,4,6),labels=c(0,2,4,6))

#close the png device
dev.off()
ALLDATA=read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
ALLDATA$Date2<-as.Date(as.character(ALLDATA$Date),format="%d/%m/%Y")
myfunc <- function(x,y){ALLDATA[ALLDATA$Date2 >= x & ALLDATA$Date2 <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
MyData <- myfunc(DATE1,DATE2)    

MyData$datetime<-as.POSIXct(paste(MyData$Date2, MyData$Time), format="%Y-%m-%d %H:%M:%S")
png("Plot4.png")
par(mar = c(4, 4, 4, 4))
par(mfrow=c(2,2))
with(MyData,{plot(Global_active_power ~ datetime, MyData, type = "l",ylab="Global Active Power (kilowatts)",xlab="")
             plot(Voltage ~ datetime, MyData, type = "l")
             plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(datetime,Sub_metering_1)
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col=NA,cex=0.75,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(Global_reactive_power ~ datetime, MyData, type = "l")


})
dev.off()

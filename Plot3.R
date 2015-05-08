ALLDATA=read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
ALLDATA$Date2<-as.Date(as.character(ALLDATA$Date),format="%d/%m/%Y")
myfunc <- function(x,y){ALLDATA[ALLDATA$Date2 >= x & ALLDATA$Date2 <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
MyData <- myfunc(DATE1,DATE2)    

##Changing Sub_metering to numeric and getting R to recognize decimal point
#A<-function(x){as.numeric(sub(",", ".", x, fixed = TRUE))}
#lapply(MyData[7:8],A)


##PLOT3
#Combine data and time
MyData$TIMEVAR<-as.POSIXct(paste(MyData$Date2, MyData$Time), format="%Y-%m-%d %H:%M:%S")
png("Plot3.png")
with(MyData,plot(TIMEVAR,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(MyData,lines(TIMEVAR,Sub_metering_1))
with(MyData,lines(TIMEVAR,Sub_metering_2,col="red"))
with(MyData,lines(TIMEVAR,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()
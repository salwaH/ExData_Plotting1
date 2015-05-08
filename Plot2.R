ALLDATA=read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
ALLDATA$Date2<-as.Date(as.character(ALLDATA$Date),format="%d/%m/%Y")
myfunc <- function(x,y){ALLDATA[ALLDATA$Date2 >= x & ALLDATA$Date2 <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
MyData <- myfunc(DATE1,DATE2)    


##Changing Global_active_power to numeric and getting R to recognize decimal point
#MyData$Global_active_power<-as.numeric(sub(",", ".", MyData$Global_active_power, fixed = TRUE))

###PLOT2
#: was getting Error in plot.new() : figure margins too large, This fixed it
par(mar=c(2,4,2,2)) 
#Combine data and time
MyData$TIMEVAR<-as.POSIXct(paste(MyData$Date2, MyData$Time), format="%Y-%m-%d %H:%M:%S")
#with(MyData,plot(Global_active_power))
png("Plot2.png")
plot(Global_active_power ~ TIMEVAR, MyData, type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
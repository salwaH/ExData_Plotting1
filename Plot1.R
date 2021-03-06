ALLDATA=read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")

ALLDATA$Date2<-as.Date(as.character(ALLDATA$Date),format="%d/%m/%Y")
myfunc <- function(x,y){ALLDATA[ALLDATA$Date2 >= x & ALLDATA$Date2 <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
MyData <- myfunc(DATE1,DATE2)    



######PLOT1
##Changing Global_active_power to numeric and getting R to recognize decimal point
#MyData$Global_active_power<-as.numeric(sub(",", ".", MyData$Global_active_power, fixed = TRUE))

png("Plot1.png")
hist(MyData$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
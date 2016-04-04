plot3<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  
  data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
  datetime<-paste(data$Date,data$Time, sep = " ")
  data$Date<-strptime(datetime, "%d/%m/%Y %X")
  
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  plot(data$Date,data$Sub_metering_1,  type = 'n',xlab = "",
       ylab = "Energy sub metering")
  lines(data$Date,data$Sub_metering_1)
  lines(data$Date,data$Sub_metering_2,col='red')
  lines(data$Date,data$Sub_metering_3,col='blue')
 
  legend('topright',lty = 1,col=c('black','red','blue'), 
         legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ))
  dev.copy(png, file='plot3.png')
  dev.off()
  
  }

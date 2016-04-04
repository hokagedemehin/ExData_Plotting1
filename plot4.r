plot4<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  
  data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
  datetime<-paste(data$Date,data$Time, sep = " ")
  data$Date<-strptime(datetime, "%d/%m/%Y %X")
  
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  par(mfrow=c(2,2))
  
  plot(data$Date,data$Global_active_power,  type = 'n',xlab = "",
          ylab = "Global Active Power")
  lines(data$Date,data$Global_active_power,lty=1)
  
  plot(data$Date,data$Voltage,type='n',ylab = 'Voltage',xlab = "datetime")
  lines(data$Date,data$Voltage,lty=1)
  
  plot(data$Date,data$Sub_metering_1,  type = 'n',xlab = "",
       ylab = "Energy sub metering")
  lines(data$Date,data$Sub_metering_1)
  lines(data$Date,data$Sub_metering_2,col='red')
  lines(data$Date,data$Sub_metering_3,col='blue')
  legend('topright',lty = 1,col=c('black','red','blue'), 
         legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ))
         
  plot(data$Date,data$Global_reactive_power, type='n',ylab = 'Global_reactive_power'
       ,xlab = 'datetime')
  lines(data$Date,data$Global_reactive_power,lty=1)
  
  dev.copy(png, file='plot4.png')
  dev.off()
}

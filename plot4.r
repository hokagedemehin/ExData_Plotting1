plot4<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  
  plot(data$Global_active_power,  type = 'n',xlab = "",
          ylab = "Global Active Power")
  lines(data$Global_active_power,lty=1)
  
  plot(data$Voltage,type='n',ylab = 'Voltage',xlab = "datetime")
  lines(data$Voltage,lty=1)
  q
  plot(data$Sub_metering_1,  type = 'n',xlab = "",
       ylab = "Energy sub metering")
  lines(data$Sub_metering_1)
  lines(data$Sub_metering_2,col='red')
  lines(data$Sub_metering_3,col='blue')
  text(2500,38,lty=1 ,label= '- Sub_metering_1')
  text(2500,34,lty=1 , col = 'red',label= '- Sub_metering_2')
  text(2500,30,lty=1 , col = 'blue',label= '- Sub_metering_3')
  
  plot(data$Global_reactive_power, type='n',ylab = 'Global_reactive_power'
       ,xlab = 'datetime')
  lines(data$Global_reactive_power,lty=1)
  dev.off()
}

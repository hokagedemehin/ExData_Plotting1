plot3<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  png("plot3.png", width=480, height=480)
  plot(data$Sub_metering_1,  type = 'n',xlab = "",
       ylab = "Energy sub metering")
  lines(data$Sub_metering_1)
  lines(data$Sub_metering_2,col='red')
  lines(data$Sub_metering_3,col='blue')
 
  text(2500,38,lty=1 ,label= '- Sub_metering_1')
  text(2500,34,lty=1 , col = 'red',label= '- Sub_metering_2')
  text(2500,30,lty=1 , col = 'blue',label= '- Sub_metering_3')
  dev.off()
  }

plot2<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  
  data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
  datetime<-paste(data$Date,data$Time, sep = " ")
  data$Date<-strptime(datetime, "%d/%m/%Y %X")
  
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  c<-plot(data$Date,data$Global_active_power,  type = 'n',xlab = "",
       ylab = "Global Active Power(kilowatts)")
  lines(data$Date,data$Global_active_power,lty=1)
  dev.copy(png, file='plot2.png')
  dev.off()
}

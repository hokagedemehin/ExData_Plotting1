plot1<-function(){

  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  
  data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
  datetime<-paste(data$Date,data$Time, sep = " ")
  data$Date<-strptime(datetime, "%d/%m/%Y %X")
  
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  hist(data$Global_active_power,xlab = "Global Active Power(kilowatts)",
       col='red',main='Global Active Power')
  dev.copy(png, file='plot1.png')
  dev.off()
}

plot2<-function(){
  
  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  png("plot2.png", width=480, height=480)
  c<-plot(data$Global_active_power,  type = 'n',xlab = "",
       ylab = "Global Active Power(kilowatts)")
  lines(data$Global_active_power,lty=1)
  dev.off()
}

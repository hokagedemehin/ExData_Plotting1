plot1<-function(){

  data<-read.csv('household_power_consumption.txt', stringsAsFactors = FALSE,sep=';')
  data[,1]<-as.Date(data[,1], "%d/%m/%Y")
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  for(i in 3:9){
    data[,i]<-as.numeric(data[,i])
  }
  hist(data$Global_active_power,xlab = "Global Active Power(kilowatts)",
       col='red',main='Global Active Power')
  
}
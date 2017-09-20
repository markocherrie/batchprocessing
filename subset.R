setwd("C:/Users/mcherrie/batchprocessing")
# loading the required packages (format)
library(ggplot2)
library(ggmap)
library(reshape2)

# subset to uk and set lat and long 
infiles<-list.files("convert", ".txt*")
change.files <- function(file)
{
  mydata = read.csv(paste0("convert/",file),  header=FALSE)
  colnames(mydata)<-(seq(0, 360, by = 0.05))-0.05
  colnames(mydata)[1]<-"Latitude"
  mydata$Latitude<-(mydata$Latitude-90.05)*-1
  mydata2<-subset(mydata, Latitude<=63 & Latitude>=48, select=c(Latitude, 0:ncol(mydata)))
  mydata2$Latitude.1<-NULL
  mdata <- melt(mydata2, id=c("Latitude"))
  write.csv(mdata, row.names=FALSE, "convert/plot2.csv")
  mydata3<-read.csv("convert/plot2.csv")
  mydata3$variable<-ifelse(mydata3$variable>180, -360+ mydata3$variable, mydata3$variable)
  colnames(mydata3) <- c("Latitude", "Longitude", "UV")
  mydata4<-subset(mydata3, Longitude>=-11 & Longitude<=4, select=c(Latitude, Longitude, UV))
  name<-sub(".txt$","-edit.txt", file)
  write.csv(mydata4, row.names=FALSE, quote=FALSE, paste0("subset/",name))
  file.remove(paste0("convert/",file))
}

######################################
lapply(infiles , change.files)
######################################

# Analyse the output
multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x,y) {merge(x,y)}, datalist)
}
  # https://www.r-bloggers.com/merging-multiple-data-files-into-one-data-frame/
  
  mymergeddata = multmerge("C:/Users/mcherrie/batchprocessing/extract")
  
  mymergeddataLONG<-reshape(mymergeddata, varying=c(3:7), direction="long", idvar="NAME", sep="", timevar="date")
  mymergeddataLONG$date<-as.Date(substr(mymergeddataLONG$date, 8,15), format="%Y%m%d")
  
  library(plotly)
  library(ggplot2)
  ## simple line chart in ggplot
  p<-ggplot(data=mymergeddataLONG, aes(x=date, y=MYD, group=NAME, color=NAME)) +
    geom_line() +
    geom_point() +
    labs(title="Mean daily UVB for Local Authorities in Scotland", x="Date" ,y="UVB (W/m2)") 
  #p<-ggplotly(p)
  #p
  #htmlwidgets::saveWidget(p, "C:/Users/mcherrie/batchprocessing/graph.html")
  
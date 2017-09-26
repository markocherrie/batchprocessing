setwd("C:/Users/mcherrie/batchprocessing")

datetoday<-gsub("-","", Sys.Date()-1)
#download file
UVdownload <-function(sat, date, UVRtype, temporal){
  tryCatch(
    {
      FTP <- paste0("ftp://apollo.eorc.jaxa.jp/pub/JASMES/Global_05km/", UVRtype, "/", temporal,"/", substring(date,1,6), "/")
      searchFTP<-paste0(FTP, sat, "02SSH_A", date, "Av1_v811_7200_3601_",UVRtype,"__8b.gz")
      download.file(searchFTP, destfile=paste0(getwd(), "/rawdata/", sub(FTP, "", searchFTP)))
    } , error=function(e){
      cat("ERROR :",conditionMessage(e), "\n")
      FTP <- paste0("ftp://apollo.eorc.jaxa.jp/pub/JASMES/Global_05km/", UVRtype, "/", temporal,"/", substring(date,1,6), "/")
      file<-paste0("MOD", "02SSH_A", date , "Av1_v601_7200_3601_",UVRtype,"__8b.gz")
      searchFTP<-paste0(FTP, "MOD", "02SSH_A", date, "Av1_v811_7200_3601_",UVRtype,"__8b.gz")
      download.file(searchFTP, destfile=paste0(getwd(), "/rawdata/", sub(FTP, "", searchFTP)))
    })
}
###########################################################
UVdownload("MYD", datetoday, "uvb", "daily")
###########################################################




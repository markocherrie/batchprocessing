# download

recurrence <- "daily"
task_name <- "download"
bat_loc <- "C:\\Users\\mcherrie\\batchprocessing\\download.bat"
time <- "23:59"
date<-"12/09/2017"

system(sprintf("schtasks /create /sd %s /sc %s /tn %s /tr \"%s\" /st %s", date, recurrence, task_name, bat_loc, time))


# convert

recurrence <- "daily"
task_name <- "convert"
bat_loc <- "C:\\Users\\mcherrie\\batchprocessing\\convert.bat"
time <- "00:15"
date<-"12/09/2017"

system(sprintf("schtasks /create /sd %s /sc %s /tn %s /tr \"%s\" /st %s", date, recurrence, task_name, bat_loc, time))

## subset

recurrence <- "daily"
task_name <- "subset"
bat_loc <- "C:\\Users\\mcherrie\\batchprocessing\\subset.bat"
time <- "00:30"
date<-"12/09/2017"

system(sprintf("schtasks /create /sd %s /sc %s /tn %s /tr \"%s\" /st %s", date, recurrence, task_name, bat_loc, time))

## raster

recurrence <- "daily"
task_name <- "raster"
bat_loc <- "C:\\Users\\mcherrie\\batchprocessing\\raster.bat"
time <- "00:45"
date<-"12/09/2017"

system(sprintf("schtasks /create /sd %s /sc %s /tn %s /tr \"%s\" /st %s", date, recurrence, task_name, bat_loc, time))


## extract

recurrence <- "daily"
task_name <- "extract"
bat_loc <- "C:\\Users\\mcherrie\\batchprocessing\\download.bat"
time <- "01:00"
date<-"12/09/2017"

system(sprintf("schtasks /create /sd %s /sc %s /tn %s /tr \"%s\" /st %s", date, recurrence, task_name, bat_loc, time))


## open tasks 
system("control schedtasks")


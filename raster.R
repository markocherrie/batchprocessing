setwd("C:/Users/mcherrie/batchprocessing")
# Add required libraries (interpolate)
library(sp)
library(raster)
library(gstat)

# single raster
infiles<-list.files("subset", "-edit.txt*")

# batch
interpolate<-function(file){
  data<- read.csv(file = paste0("subset/",file), header = TRUE)
  data<-na.omit(data)
  coordinates(data) = ~Longitude + Latitude
  x.range <- as.numeric(c(-11, 4))
  y.range <- as.numeric(c(48,63))
  # Create an empty grid where n is the total number of cells
  grd              <- as.data.frame(spsample(data, "regular", n=90000))
  names(grd)       <- c("X", "Y")
  coordinates(grd) <- c("X", "Y")
  gridded(grd)     <- TRUE  # Create SpatialPixel object
  fullgrid(grd)    <- TRUE  # Create SpatialGrid object
  
  # Interpolate the surface using a power value of 2 (idp=2.0)
  dat.idw <- idw(UV~1,data,newdata=grd,idp=2.0, na.action=na.omit)
  rasterDF <- raster(dat.idw)
  bb <- extent(-11, 4, 48, 63)
  extent(rasterDF) <- bb
  crs(rasterDF) <- CRS("+proj=longlat +datum=WGS84")
  name<-sub("Av1_v8111_7200_3601_uv__8b-edit.txt", ".img", file)
  writeRaster(rasterDF,paste0("raster/", name), format = "HFA", overwrite=TRUE)
  file.remove(paste0("subset/",file))
}

############################################
lapply(infiles, interpolate)
############################################
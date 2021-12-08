#' Recognize EEZ region Function
#' This function allows you to identify location in which EEZ from a numeric vector.
#' @param x A numeric vector.
#' @keywords location
#' @format list with random numbers
"idfEEZ"
#' @export
#' @import sf
#' @import sp
#' @import rgdal
#' @examples
#' idfEEZ()



idfEEZ<-function(lon,lat,eez_rg){

loc<-data.frame(lon=lon,lat=lat)
sptacsat<- SpatialPoints(coordinates(loc))

proj4string(sptacsat) <-CRS("+init=epsg:4326")


sptacsat_O<- spTransform(sptacsat, CRS(proj4string(eez_rg)))
idx<- over(sptacsat_O,eez_rg)

loc$EEZcode<-idx$EEZ
return(loc)

}



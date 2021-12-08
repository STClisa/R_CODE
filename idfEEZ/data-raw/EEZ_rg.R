library(maps)
library(mapproj)
library(mapdata)
library(mapplots)
library(ggplot2)
library(sp)
library(totalcensus)
library(rgdal)
library(scatterpie)
library(reshape2)
library(gridExtra)

eez_rg<- readOGR("D:/R/packagev2/idfEEZ/data-raw/World_EEZ_v8_2014.shp",stringsAsFactors=FALSE)
save(eez_rg, file="D:/R/packagev2/idfEEZ/data/eez_rg.RData")


usethis::use_data(eez_rg, overwrite = TRUE)
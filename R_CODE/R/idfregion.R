#' Recognize PAC IND ATL ocean region Function
#' This function allows you to identify location in which ocean region from a numeric vector.
#' @param x A numeric vector.
#' @keywords location
#' @export
#' @import sf
#' @examples
#' idfregion()

idfregion <- function(lon,lat){
        
        p1 = list(rbind(c(-180,-70),c(-70,-70),c(-70,5),c(-77,7.75),c(-79,9.25),c(-81,8.5),c(-82,8.5),c(-91,17.5),c(-101,17.5),c(-101,70),c(-180,70),c(-180,-70)))
        p2 = list(rbind(c(150,-70),c(180,-70),c(180,70),c(99,70),c(99,8.5),c(103,2.5),c(103,-2.5),c(106,-6),c(109,-7.5),c(113.46667,-8),c(129,-8),c(129,-15),c(150,-28),c(150,-70)))
        p = st_sfc(st_multipolygon(list(p1,p2)))
      
        i = st_sfc(st_polygon(list(rbind(c(42,48),c(42,30),c(20,30),c(20,5),c(20,-70),c(150,-70),c(150,-30),c(129,-20),c(129,-8),c(113.46667,-8),c(109,-7.5),c(106,-6),c(105.14,-5),c(99,2.4),c(103,2.4),c(99,8.5),c(99,70),c(42,48)))))
        
        a = st_sfc(st_polygon(list(rbind(c(-101,70),c(-101,17.5),c(-91,17.5),c(-82,8.5),c(-81,8.5),c(-79,9.25),c(-77,7.75),c(-70,5),c(-70,-70),c(20,-70),c(20,30),c(-5,30),c(-5,40),c(6,48),c(42,48),c(99,70),c(-101,70)))))
        
        
        p_matrix<-as.matrix(data.frame(lon=lon,lat=lat),ncol = 2)

        p_multi<-st_multipoint(x = p_matrix)
        d<-st_cast(st_sfc(p_multi), "POINT")
        
        oc <- ifelse(st_intersects(d, p, sparse = FALSE)==TRUE,"PAC",ifelse(st_intersects(d, i, sparse = FALSE)==TRUE,"IND",ifelse(st_intersects(d, a, sparse = FALSE)==TRUE,"ATL","-")))
        return (oc)
}

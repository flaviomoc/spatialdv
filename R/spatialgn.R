#' Calculate average trait generalization for spatial data
#'
#' @param x Object of class SpatRaster with binarized distribution projected to all species in the reference scenario
#' @param y Object of class data.frame with species traits as columns
#' @param trait Column name to be used
#'
#' @return Object of class SpatRaster with average trait chosen
#' @export
#'
#' @examples
#' set.seed(100)
#' mass <- runif(10, .5, 2)
#' elev <- sample(500:1000, 10)
#' ref <- terra::rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))
#' traits <- as.data.frame(cbind(mass, elev))
#' rownames(traits) <- paste0("sp", 1:nrow(traits))
#' res <- spatialgn(ref, traits, "mass")
#' terra::plot(res, main = names(res))
#'
spatialgn <- function(x, y, trait) {
  t <- y[ , trait]
  x[x == 0] <- NA
  gen <- x * t
  res <- terra::app(gen, mean, na.rm = TRUE)
  names(res) <- trait
  return(res)
}

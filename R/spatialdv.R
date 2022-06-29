#' Calculate diversity patterns for spatial data
#'
#' Calculate alpha and beta diversity for spatial data
#'
#' @param x Object of class SpatRaster with binarized distribution projected to all species in the reference scenario
#' @param y Object of class SpatRaster with binarized distribution projected to all species in the future scenario
#' @param z Index to be return
#'
#' @return Plot object of class SpatRaster according to the index chosen
#' @export
#'
#' @examples
#' set.seed(100)
#' ref <- terra::rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))
#' fut <- terra::rast(array(sample(c(rep(1, 300), rep(0, 700))), dim = c(10, 10, 10)))
#' res <- spatialdv(ref, fut, "beta")
#' terra::plot(res, main = names(res))
#'
spatialdv <- function(x, y, z = "delta"){
  if(z == "alpha1"){
    res <- sum(x > 0) # richness of reference scenario
    names(res) <- "Reference richness"
  } else if(z == "alpha2"){
    res <- sum(y > 0) # richness of future scenario
    names(res) <- "Future richness"
  } else if(z == "delta"){
    res <- sum(y > 0) - sum(x > 0) # difference between future and reference scenarios
    names(res) <- "Delta richness"
  } else if(z == "beta"){
    total <- x + y # total number of species
    a <- sum(total == 2) # species in both scenarios simultaneously
    b <- sum(x > y, 1, 0) # species in reference scenario only
    c <- sum(y > x, 1, 0) # species in future scenario only
    res <- (b + c) / (a + b + c) # beta diversity calculation
    names(res) <- "Beta diversity"
  } else if(z == "turn"){
    total <- x + y
    a <- sum(total == 2)
    b <- sum(x > y, 1, 0)
    c <- sum(y > x, 1, 0)
    Bjac <- (b + c) / (a + b + c)
    res <- (2 * min(b, c)) / (a + (2 * min(b, c))) # turnover calculation
    names(res) <- "Turnover"
  } else if(z == "nest"){
    total <- x + y
    a <- sum(total == 2)
    b <- sum(x > y, 1, 0)
    c <- sum(y > x, 1, 0)
    Bjac <- (b + c) / (a + b + c)
    Bjtu <- (2 * min(b, c)) / (a + (2 * min(b, c)))
    res <- Bjac - Bjtu # nestedness calculation
    names(res) <- "Nestedness"
  } else if(z == "ratio"){
    total <- x + y
    a <- sum(total == 2)
    b <- sum(x > y, 1, 0)
    c <- sum(y > x, 1, 0)
    Bjac <- (b + c) / (a + b + c)
    Bjtu <- (2 * min(b, c)) / (a + (2 * min(b, c)))
    res <- Bjtu / Bjac # ratio calculation (turnover divided by beta diversity)
    names(res) <- "Ratio"
  }
  return(res) # plot SpatRaster calculated for chosen index
}

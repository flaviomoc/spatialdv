# creating SpatRaster from random array
set.seed(100)

ref <- terra::rast(array(sample(c(rep(1, 750), rep(0, 250))), dim = c(10, 10, 10)))

fut <- terra::rast(array(sample(c(rep(1, 300), rep(0, 700))), dim = c(10, 10, 10)))

mass <- runif(10, .5, 2)
elev <- sample(500:1000, 10)
traits <- as.data.frame(cbind(mass, elev))
rownames(traits) <- paste0("sp", 1:nrow(traits))

usethis::use_data(data, overwrite = TRUE)

# exporting SpatRaster
if(!dir.exists("inst/extdata")) dir.create("inst/extdata", recursive = TRUE)
terra::writeRaster(ref, "inst/extdata/ref.tif")
terra::writeRaster(fut, "inst/extdata/fut.tif")

writexl::write_xlsx(traits, "data-raw/traits.xlsx")

test_that("Test that spatialgn function works", {

  # load data
  ref <- terra::rast(system.file("extdata", "ref.tif", package = "spatialdv"))
  traits <- as.data.frame(readxl::read_excel(system.file("extdata", "traits.xlsx", package = "spatialdv")))

  # tests
  expect_s4_class(spatialgn(ref, traits, "mass"), "SpatRaster")
  expect_equal(names(spatialgn(ref, traits, "mass")), "mass")
  expect_s4_class(spatialgn(ref, traits, "elev"), "SpatRaster")
  expect_equal(names(spatialgn(ref, traits, "elev")), "elev")
})

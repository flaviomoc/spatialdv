test_that("Test that spatialdv function works", {

  # load data
  ref <- terra::rast(system.file("extdata", "ref.tif", package = "spatialdv"))
  fut <- terra::rast(system.file("extdata", "fut.tif", package = "spatialdv"))

  # tests
  expect_s4_class(spatialdv(ref, fut, "beta"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "beta")), "Beta diversity")
  expect_s4_class(spatialdv(ref, fut, "alpha1"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "alpha1")), "Reference richness")
  expect_s4_class(spatialdv(ref, fut, "alpha2"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "alpha2")), "Future richness")
  expect_s4_class(spatialdv(ref, fut, "turn"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "turn")), "Turnover")
  expect_s4_class(spatialdv(ref, fut, "nest"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "nest")), "Nestedness")
  expect_s4_class(spatialdv(ref, fut, "ratio"), "SpatRaster")
  expect_equal(names(spatialdv(ref, fut, "ratio")), "Ratio")
})


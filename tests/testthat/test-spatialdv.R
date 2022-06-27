test_that("Test that spatialdv function works", {

  # load data
  ref <- terra::rast(system.file("extdata", "ref.tif", package = "spatialdv"))
  fut <- terra::rast(system.file("extdata", "fut.tif", package = "spatialdv"))

  # custom_test
  expect_custom1 <- function(obj) {
    r <- ifelse(obj$lonlat == "TRUE" & obj$values == "TRUE", "TRUE", "FALSE")
    return(r)
  }
  expect_custom2 <- function(obj) {
    r <- ifelse(sum(obj$range) != 0, "TRUE", "FALSE")
    return(r)
  }

  # tests
  expect_equal(expect_custom1(spatialdv(ref, fut, "alpha1")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "alpha1")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "alpha2")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "alpha2")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "delta")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "delta")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "beta")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "beta")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "turn")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "turn")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "nest")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "nest")), "TRUE")
  expect_equal(expect_custom1(spatialdv(ref, fut, "ratio")), "TRUE")
  expect_equal(expect_custom2(spatialdv(ref, fut, "ratio")), "TRUE")
})


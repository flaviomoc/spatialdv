test_that("Test that spatialgn function works", {

  # load data
  ref <- terra::rast(system.file("extdata", "ref.tif", package = "spatialdv"))
  traits <- as.data.frame(readxl::read_excel(system.file("extdata", "traits.xlsx", package = "spatialdv")))

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
  expect_equal(expect_custom1(spatialgn(ref, traits, "mass")), "TRUE")
  expect_equal(expect_custom2(spatialgn(ref, traits, "mass")), "TRUE")
  expect_equal(expect_custom1(spatialgn(ref, traits, "elev")), "TRUE")
  expect_equal(expect_custom2(spatialgn(ref, traits, "elev")), "TRUE")
})

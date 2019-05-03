context("Check private auxiliary functions for summary measures")

test_that("aux_mean gives the right value", {
  expect_equal(aux_mean(10,0.3), 3)
  expect_equal(aux_mean(20,0.5), 10)
  expect_equal(aux_mean(30,0.8), 24)
})


test_that("aux_mean gives the result of valid length", {
  expect_length(aux_mean(10,0.3), 1)
})

test_that("aux_mean gives the result of valid type", {
  expect_type(aux_mean(10,0.3), "double")
})


test_that("aux_variance gives the right value", {
  expect_equal(aux_variance(10,0.3), 2.1)
  expect_equal(aux_variance(20,0.5), 5)
  expect_equal(aux_variance(30,0.8), 4.8)
})


test_that("aux_variance gives the result of valid length", {
  expect_length(aux_variance(10,0.3), 1)
})

test_that("aux_variance gives the result of valid type", {
  expect_type(aux_variance(10,0.3), "double")
})

test_that("aux_mode gives the right value", {
  expect_equal(aux_mode(10,0.3), 3)
  expect_equal(aux_mode(20,0.5),10)
  expect_equal(aux_mode(30,0.8), 24)
})

test_that("aux_mode gives the result of valid length", {
  expect_length(aux_mode(10,0.3), 1)
})

test_that("aux_mode gives the result of valid type", {
  expect_type(aux_mode(10,0.3), "integer")
})

test_that("aux_skewness gives the right value", {
  expect_equal(round(aux_skewness(10,0.3),7), 0.2760262)
  expect_equal(round(aux_skewness(20,0.4),7),  0.09128709)
  expect_equal(round(aux_skewness(30,0.8),7),  -0.2738613)
})

test_that("aux_skewness gives the result of valid length", {
  expect_length(aux_skewness(10,0.3), 1)
})

test_that("aux_skewness gives the result of valid type", {
  expect_type(aux_skewness(10,0.3), "double")
})

test_that("aux_kurtosis gives the right value", {
  expect_equal(round(aux_kurtosis(10,0.3),7), -0.1238095)
  expect_equal(aux_kurtosis(20,0.5), -0.1)
  expect_equal(round(aux_kurtosis(30,0.8),8), 0.008333333)
})

test_that("aux_kurtosis gives the result of valid length", {
  expect_length(aux_kurtosis(10,0.3), 1)
})

test_that("aux_kurtosis gives the result of valid type", {
  expect_type(aux_kurtosis(10,0.3), "double")
})





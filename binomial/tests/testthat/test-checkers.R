context("Check private checker functions")

test_that("check_prob with valid value",{
  expect_true(check_prob(0.5))
  expect_true(check_prob(0.1))
})

test_that("check_prob fails with invalid lengths",{
    expect_error(check_prob(c(1,2)))
  expect_error(check_prob(1:5))
    expect_error(check_prob(c("a","b")))
})

test_that("check_prob fails with invalid types",{
  expect_error(check_prob("e"))
  expect_error(check_prob(10.5))
})

test_that("check_prob fails with invalid values",{
  expect_error(check_prob(-10))
  expect_error(check_prob(3))
})


test_that("check_trials with valid value",{
  expect_true(check_trials(5))
  expect_true(check_trials(3))
})

test_that("check_trials fails with invalid lengths",{
  expect_error(check_trials(c(1,2)))
  expect_error(check_trials(1:5))
  expect_error(check_trials(c(3,5)))
})

test_that("check_trials fails with invalid types",{
  expect_error(check_trials("e"))
})

test_that("check_trails fails with invalid values",{
  expect_error(check_trails(-10))
  expect_error(check_trails(10.5))
})


test_that("check_success with valid value",{
  expect_true(check_success(c(1,5),6))
  expect_true(check_success(3,5))
})

test_that("check_success fails to have successes bigger than trials",{
  expect_error(check_success(6,4))
  expect_error(check_success(1:5,3))
})

test_that("check_success fails with invalid types",{
  expect_error(check_success(4.7,4))
  expect_error(check_success(3.3,4))
})

test_that("check_success fails with invalid values",{
  expect_error(check_success(-10,4))
})

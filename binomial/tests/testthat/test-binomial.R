context("Check main binomial functions")

test_that("bin_choose gives the right result",{
   expect_equal(bin_choose(5,1),5)
   expect_equal(bin_choose(5,1:3),c(5,10,10))
})

test_that("bin_choose fails with k bigger than n",{
  expect_error(bin_choose(1,2))
})

test_that("bin_choose gives the right lengths",{
  expect_length(bin_choose(5,1:3),3)
})


test_that("bin_probability gives the right result",{
  expect_equal(bin_probability(3,5,0.5),0.3125)
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
})

test_that("bin_probability fails with success bigger than trials",{
  expect_error(bin_probability(5,4,0.2))
})

test_that("bin_probability gives the right length",{
  expect_length(bin_probability(c(1,2),5,0.3),2)
})

test_that("bin_probability fails with invalid inputs", {
  expect_error(bin_probability(success = -2, trials = 5, prob = 0.5))
  expect_error(bin_probability(success = 3:6, trials = 5, prob = 0.5))
})

test_that("the class of bin_distribution is c(bindis,data.frame)",{
  expect_is(bin_distribution(5,0.5),c("bindis","data.frame"))
})

test_that("bin_distribution fails with invalid value",{
  expect_error(bin_distribution(5,2))
  expect_error(bin_distribution(trials = -10, prob = 0.5))
  expect_error(bin_distribution(trials = 6, prob = -0.3))
  expect_error(bin_distribution(trials = 3.5, prob = 0.5))
})

test_that("bin_distribution gives the right length",{
  expect_length(bin_distribution(5,0.3)$success,6)

})


test_that("the class of bin_cumulative is c(bincum,data.frame)",{
  expect_is(bin_cumulative(5,0.5),c("bincum","data.frame"))
})

test_that("bin_cumulative fails with invalid value",{
  expect_error(bin_cumulative(5,3))
  expect_error(bin_cumulative(5,-3))
  expect_error(bin_cumulative(-5,3))
})

test_that("bin_cumulative gives the right length",{
  expect_length(bin_cumulative(5,0.3)$success,6)
})


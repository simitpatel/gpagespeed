library(testthat)
library(gpagespeed)

context("gpagespeed functions")

test_check("gpagespeed")

test_that("speedfinder function", {
  expect_equal(class(speedfinder("https://www.cars.com","mobile",key)),
               class(data.frame()))
  expect_equal(nrow(speedfinder("https://www.cars.com","mobile",key)), 1)
  })

test_that("speedlist function", {
  expect_equal(class(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                                 "mobile",key)),
               class(data.frame()))
  expect_equal(nrow(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                               "mobile",key)), 3)
})

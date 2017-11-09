library(testthat)
library(gpagespeed)

context("gpagespeed functions")

test_check("gpagespeed")

gspeed_key = 'YOUR_API_KEY'

test_that("speedfinder function", {
  expect_equal(class(speedfinder("https://www.cars.com","mobile",key=gspeed_key,filter_third_party_resources = TRUE)),
               class(data.frame()))
  expect_equal(nrow(speedfinder("https://www.cars.com","mobile",key=gspeed_key)), 1)
  })

test_that("speedlist function", {
  expect_equal(class(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                                 "mobile",key=gspeed_key)),
               class(data.frame()))
  expect_equal(nrow(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                               "mobile",key=gspeed_key)), 3)
})

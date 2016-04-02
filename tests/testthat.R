library(testthat)
library(gpagespeed)

context("gpagespeed functions")

test_check("gpagespeed")

test_that("speedfinder function", {
  expect_equal(class(speedfinder("https://www.cars.com","mobile","AIzaSyCj7QgHqxx81JtITkkZaLTfPM2GEvx8U1Q")),
               class(data.frame()))
  expect_equal(nrow(speedfinder("https://www.cars.com","mobile","AIzaSyCj7QgHqxx81JtITkkZaLTfPM2GEvx8U1Q")), 1)
  })

test_that("speedlist function", {
  expect_equal(class(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                                 "mobile","AIzaSyCj7QgHqxx81JtITkkZaLTfPM2GEvx8U1Q")),
               class(data.frame()))
  expect_equal(nrow(speedlist(c("https://www.cars.com","https://www.yahoo.com","https://www.techmeme.com"),
                               "mobile","AIzaSyCj7QgHqxx81JtITkkZaLTfPM2GEvx8U1Q")), 3)
})

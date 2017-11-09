#' Speed results for 1 URL
#'
#' The speedfinder function returns the Google Page Speed Insights test results for a single URL as a dataframe.
#'
#' @param url A URL on which to run the Google Page Speed Insights test.
#' @param strategy Whether the URL should be evaluated in a mobile or desktop context. Accordingly, acceptable values
#' are either the string "mobile" or the string "desktop".
#' @param key A unique key obtainable from Google by registering for free as a Google developer.
#' @examples
#' speedfinder("https://www.cars.com","mobile",key)

#' @export
speedfinder <- function(url,strategy,key) {
  pid <- RJSONIO::fromJSON(paste0("https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=",url,"&strategy=",strategy,"&key=",key))
  frame1 <- cbind(as.data.frame(pid[2]),as.data.frame(pid[3]),as.data.frame(pid[5]),as.data.frame(pid[6]))
  rbind.data.frame(data.frame(), frame1,make.row.names=FALSE)
}

#' Function within speedlist
#'
#' Speedfinder2 is a function utilized by speedlist to allow a list of URLs to be submitted to the Google Page Speed
#' Insights API.
#' @param url A list of URLs on which to run the Google Page Speed Insights test.
#' @param strategy Whether the list of URLs should be evaluated in a mobile or desktop context. Accordingly, acceptable values
#' are either the string "mobile" or the string "desktop".
#' @param key A unique key obtainable from Google by registering for free as a Google developer.

#' @export
speedfinder2 <- function(url,strategy,key) {
  pid <- RJSONIO::fromJSON(paste0("https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=",url,"&strategy=",strategy,"&key=",key))
  frame1 <- cbind(as.data.frame(pid[2]),as.data.frame(pid[3]),as.data.frame(pid[5]),as.data.frame(pid[6]))
}

#' Speed results for a list of URLs
#'
#' The speedlist function submits a list of URLs to the Google Page Speed Insights API, and returns a dataframe in which
#' each row contains the results from the API for a unique URL in the list.
#'
#' @param pagelist A list of URLs on which to run the Google Page Speed Insights test.
#' @param strategy Whether the list of URLs should be evaluated in a mobile or desktop context. Accordingly, acceptable values
#' are either the string "mobile" or the string "desktop".
#' @param key A unique key obtainable from Google by registering for free as a Google developer.
#' @examples
#' speedlist(listofURLs,"mobile",key)

#' @export
speedlist <- function(pagelist,strategy,key) {
  list1 <- lapply(pagelist,speedfinder2,strategy,key)
  suppressWarnings(do.call(gtools::smartbind,list1))
  }



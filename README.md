# gpagespeed

gpagespeed is a package designed to facilitate utilization of the Google PageSpeed Insights API. The PageSpeed Insights API provides insight into how Google's bots evaluate a given page, and the factors that web developers may wish to consider in building pages that will render faster. See Google's documentation on the PageSpeed Insights API to learn more about what the API offers as well as practical examples of its usage.

The PageSpeed Insights API returns a numeric summary of the results of each page, as well as recommendations in text format. Currently, this package is designed to support only retrieving the numeric summary, which includes the overall speed score as well as metrics pertaining to the number of file requests and sizes in kilobytes of images, HTML, CSS, and JavaScript. The package offers two functions: speedfinder and speedlist. These functions are documented below.

# Functions in gpagespeed

<strong>`speedfinder`</strong> The `speedfinder` function returns a dataframe with a single observation and columns of numeric data as its response. It accepts three arguments:

* _url_: The url argument refers to the URL of the document on which the PageSpeed Insights API should be run and the corresponding summary metrics returned.    
* _strategy_: This argument should have one of two potential text string inputs: "`desktop`" or "`mobile`" to denote the device context that the PageSpeed Insights API should use in its evaluation.   
* _key_: This is the key that is required to use the API. [Visit Google's Developer Console](https://developers.google.com/console/help/using-keys) to obtain your free key.    

<strong>`speedlist`</strong> The `speedlist` function is like the `speedfinder` function, but allows processing of many URLs and returns a dataframe in which each observation corresponds to a unique URL. Like `speedfinder`, it accepts three arguments:

* _pagelist_: A list object in which each item in the list is a URL listed as a character string.   
* _strategy_: This argument should have one of two potential text string inputs: "`desktop`" or "`mobile`" to denote the device context that the PageSpeed Insights API should use in its evaluation.   
* _key_: This is the key that is required to use the API. [Visit Google's Developer Console](https://developers.google.com/console/help/using-keys) to obtain your free key.    

# Example Usage

Below are examples of how the `speedfinder` and `speedlist` functions could be called in an R script.

``` # Get speed metrics for a single URL and assign it to a variable ```

``` df1 <- speedfinder("https://www.cars.com", "mobile", "atextkeyigotfromgoogle111") ```

``` # Get speed metrics for a list of URLs and have it all returned in a single dataframe ```

``` df2 <- speedlist(c("https://www.cars.com", "http://www.yahoo.com", "http://www.techmeme.com"), 
                        "mobile",
                        "atextkeyigotfromgoogle111") ``` 

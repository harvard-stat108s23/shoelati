
#test that the number of rows in the filtered dataset is smaller than the orginal dataset
testthat::test_that("Less than or equal number of rows in the filtered dataset", {
  testthat::expect_lte(nrow(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), grouped_variable = size_us, response_variable = price_usd)), nrow(shoelati))
})


#test that there is an error when input a categorical variable for numerical response variable
testthat::test_that("Errors when input the wrong class", {
  testthat::expect_error(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), grouped_variable = size_us, response_variable = material))
})



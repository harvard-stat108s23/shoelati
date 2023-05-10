
#test that the number of rows in the filtered dataset is smaller than the original dataset
testthat::test_that("Less than or equal number of rows in the filtered dataset", {
  testthat::expect_lte(nrow(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = size_us, response_variable = price_usd)), nrow(shoelati))
})

#test that there is an error when the categories selected to filter by are not found in the the variable of interest.
testthat::test_that("Errors when variable_filteredOn not found in variable_toFilter", {
  testthat::expect_error(summaryFunctions(data = shoelati, variable_toFilter = gender, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = size_us, response_variable = price_usd))
})

#test that the explanatory variable could be either categorical or numeric
#test that there is no error when the explanatory variable is categorical
testthat::test_that("No error with a categorical explanatory variable", {
  testthat::expect_no_error(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = material, response_variable = price_usd))
})
#test that there is no error when the explanatory variable is numeric
testthat::test_that("No error with a numeric explanatory variable", {
  testthat::expect_no_error(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = size_us, response_variable = price_usd))
})


#test that there is an error when the response variable isn't numerical
testthat::test_that("Errors when response variable isn't numeric", {
  testthat::expect_error(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = size_us, response_variable = gender))
})

#test that there is an error when the explanatory variable and the variable to filter on are not unique variables.
testthat::test_that("Explanatory and variable to filter must be unique variables", {
  testthat::expect_error(summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"), explanatory_variable = brand, response_variable = price_usd))
})




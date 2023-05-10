

#test that there is an error when the categories selected to filter by are not found in the the variable of interest.
testthat::test_that("Errors when variable_filteredOn not found in variable_toFilter", {
  testthat::expect_error(boxplot3Variables(data = shoelati, variable_toFilter = gender,
                                             variable_filteredOn = c("Adidas", "Nike"),
                                             explanatory_variable = type, response_variable = price_usd,
                                             graph_title = "Average Price by Type of Shoe According to Gender",
                                             xaxis_label = "Type", yaxis_label = "Price (USD)"))
})

#test that the explanatory variable could be either categorical or numerical
#test that there is no error when the explanatory variable is categorical
testthat::test_that("No error with a categorical explanatory variable", {
  testthat::expect_no_error(boxplot3Variables(data = shoelati, variable_toFilter = brand,
                                              variable_filteredOn = c("Adidas", "Nike"),
                                              explanatory_variable = type, response_variable = price_usd,
                                              graph_title = "Average Price by Type of Shoe According to Brand",
                                              xaxis_label = "Type", yaxis_label = "Price (USD)"))
})
#test that there is no error when the explanatory variable is numerical
testthat::test_that("No error with a numerical explanatory variable", {
  testthat::expect_no_error(boxplot3Variables(data = shoelati, variable_toFilter = brand,
                                              variable_filteredOn = c("Adidas", "Nike"),
                                              explanatory_variable = size_us, response_variable = price_usd,
                                              graph_title = "Average Price by Shoe Size According to Brand",
                                              xaxis_label = "Type", yaxis_label = "Price (USD)"))
})


#test that there is an error when the response variable isn't numeric
testthat::test_that("Errors when response variable isn't numeric", {
  testthat::expect_error(boxplot3Variables(data = shoelati, variable_toFilter = brand,
                                           variable_filteredOn = c("Adidas", "Nike"),
                                           explanatory_variable = type, response_variable = gender,
                                           graph_title = "Average Gender for each Type of Shoe According to Brand",
                                           xaxis_label = "Type", yaxis_label = "Price (USD)"))
})

#test that there is an error when the explanatory variable and the variable to filter on are not unique variables.
testthat::test_that("Explanatory and variable to filter must be unique variables", {
  testthat::expect_error(boxplot3Variables(data = shoelati, variable_toFilter = brand,
                                          variable_filteredOn = c("Adidas", "Nike"),
                                          explanatory_variable = brand, response_variable = price_usd,
                                          graph_title = "Average Price by Type of Shoe According to Brand",
                                          xaxis_label = "Type", yaxis_label = "Price (USD)"))
})





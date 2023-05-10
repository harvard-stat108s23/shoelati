
#test that there is an error when the categories selected to filter by are not found in the the variable of interest.
testthat::test_that("Errors when variable_filteredOn not found in variable_toFilter", {
  testthat::expect_error(emojiViz(data = shoelati, variable_toFilter = gender, variable_filteredOn = c("Adidas", "Nike"),
                                  explanatory_variable = size_us, response_variable = price_usd, emoji_code = emoji,
                                  num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
                                  graph_title = "Shoe Price According to Shoe Size", xaxis_label = "Size (US)", yaxis_label = "Price (USD)"))
})


#test that there is an error when the explanatory variable isn't numeric
testthat::test_that("Errors when explanatory variable isn't numeric", {
  testthat::expect_error(emojiViz(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"),
                                  explanatory_variable = material, response_variable = price_usd, emoji_code = emoji,
                                  num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
                                  graph_title = "Shoe Price According to Material", xaxis_label = "Material", yaxis_label = "Price (USD)")
  )})


#test that there is an error when the response variable isn't numeric
testthat::test_that("Errors when response variable isn't numeric", {
  testthat::expect_error(emojiViz(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"),
                                  explanatory_variable = size_us, response_variable = model, emoji_code = emoji,
                                  num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
                                  graph_title = "Shoe Model According to Shoe Size", xaxis_label = "Size (US)", yaxis_label = "Model")
  )})


#test that there is an error when the explanatory variable and the response variable on are not unique variables.
testthat::test_that("Explanatory and response variables must be unique variables", {
  testthat::expect_error(emojiViz(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"),
                                  explanatory_variable = size_us, response_variable = size_us, emoji_code = emoji,
                                  num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
                                  graph_title = "Shoe Size According to Shoe Size", xaxis_label = "Size (US)", yaxis_label = "Size (US)")
  )
})

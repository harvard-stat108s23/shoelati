
#check for variable types


#check if it errors out with the wrong class
testthat::test_that("Errors when input the wrong class", {
  testthat::expect_error(boxplot3Variables(data = shoelati, cat_variable = material, cat_filteredOn = c("Adidas", "Nike"),
                                           cat_variable_x = type, num_variable_y = price_usd,
                                           graph_title = "Average Price by Type of Shoe According to Brand",
                                           xaxis_label = "Type", yaxis_label = "Price (USD)"))
})






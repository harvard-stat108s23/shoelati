

testthat::test_that("Errors when input the wrong class", {
  testthat::expect_error(emojiViz(data = shoelati, cat_variable = brand, cat_filteredOn = c("Adidas", "Nike"),
                                  num_variable_x = size_us, num_variable_y = price_usd, emoji_code = emoji,
                                  num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
                                  graph_title = "Shoe Price According to Shoe Size", xaxis_label = "Size (US)", yaxis_label = "Price (USD)"))
})




test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

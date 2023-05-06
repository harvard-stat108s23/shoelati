
#' Create a graph between two numerial variables using emojis as the geom and filtereing by a categorical variable
#'
#' @param data A data frame
#' @param cat_variable Categorical variable in the data frame to filter on.
#' @param cat_filteredOn Filter the categorical variable (cat_variable) according to relevant subcategories.
#' @param num_variable_x Numerical variable to plot on the x-axis of the visualization.
#' @param num_variable_y Numerical variable to plot on the y-axis of the visualization.
#' @param emoji_code Variable which includes the emoji codes for our dataset.
#' @param graph_title The graph's label.
#' @param xaxis_label The x-axis's label.
#' @param yaxis_label The y-axis's label.
#' @param num_variable_x_min The minimum value of the variable plotted on the x-axis.
#' @param num_variable_x_max The maximum value of the variable plotted on the x-axis.
#' @param num_variable_y_min The minimum value of the variable plotted on the y-axis.
#' @param num_variable_y_max The maximum value of the variable plotted on the y-axis.
#'
#' @return A visualization similar to a scatterplot, but which uses emojis as the geom.
#' @export
#'
#' @examples
#' emojiViz(data = shoelati, cat_variable = brand, cat_filteredOn = c("Adidas", "Nike"),
#' num_variable_x = size_us, num_variable_y = price_usd, emoji_code = emoji,
#' num_variable_x_min = 6, num_variable_x_max = 12, num_variable_y_min = 25, num_variable_y_max = 250,
#' graph_title = "Shoe Price According to Shoe Size", xaxis_label = "Size (US)", yaxis_label = "Price (USD)")


emojiViz <- function(data, cat_variable, cat_filteredOn, num_variable_x, num_variable_y,
                     emoji_code, graph_title, xaxis_label, yaxis_label,
                     num_variable_x_min = 0, num_variable_x_max = 100,
                     num_variable_y_min = 0, num_variable_y_max = 100){

  #filter cat_variable according to cat_filteredOn
  data_filtered_cat <- data |>
    dplyr::filter({{cat_variable}} %in% c({{cat_filteredOn}}))

  #make visualization for two numerical variables using emoji icons
  emojiPlot <- ggplot2::ggplot(data = data_filtered_cat,
                  mapping = ggplot2::aes(x = {{num_variable_x}},
                                         y = {{num_variable_y}},
                                         image = {{emoji_code}})) +
    ggimage::geom_emoji(position = ggplot2::position_jitter(width = 3, height = 3)) +
    ggplot2::xlim(num_variable_x_min, num_variable_x_max) +
    ggplot2::ylim(num_variable_y_min, num_variable_y_max) +
    ggplot2::labs(title = graph_title,
                  caption = "This visualization uses emojis as its geom.",
                  x = xaxis_label,
                  y = yaxis_label)

  return(emojiPlot)

}






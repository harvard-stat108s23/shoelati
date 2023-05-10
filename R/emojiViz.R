
#'An emoji visualization
#'
#' Creates a graph using two numeric variables and emojis as the geom (filtering by a categorical variable) to determine trends in general shoe type and variables of interest.
#'
#' @param data A data frame
#' @param variable_toFilter One numeric or categorical variable in the data frame to filter on.
#' @param variable_filteredOn Filter the numeric or categorical variable (variable_toFilter) according to relevant subcategories of interest.
#' @param explanatory_variable One NUMERIC variable mapped to the x-axis (this is different from the other functions which can use numeric or categorical inputs).
#' @param response_variable One numeric variable to mapped to the y-axis.
#' @param graph_title The graph's label.
#' @param xaxis_label The x-axis's label.
#' @param yaxis_label The y-axis's label.
#' @param emoji_code The unicode for emojis matched to the rows in the dataframe
#' @param num_variable_x_min The minimum value of the variable plotted on the x-axis.
#' @param num_variable_x_max The maximum value of the variable plotted on the x-axis.
#' @param num_variable_y_min The minimum value of the variable plotted on the y-axis.
#' @param num_variable_y_max The maximum value of the variable plotted on the y-axis.
#'
#' @return A visualization similar to a scatterplot, but which uses emojis as the geom.   Rows may be removed in order to make the visualization readable.
#' @export
#'
#' @examples
#' emojiViz(data = shoelati, variable_toFilter = brand,
#' variable_filteredOn = c("Adidas", "Nike"),explanatory_variable = size_us,
#' response_variable = price_usd, emoji_code = emoji,
#' num_variable_x_min = 6, num_variable_x_max = 12,
#' num_variable_y_min = 25, num_variable_y_max = 250,
#' graph_title = "Shoe Price According to Shoe Size",
#' xaxis_label = "Size (US)", yaxis_label = "Price (USD)")


emojiViz <- function(data, variable_toFilter, variable_filteredOn, explanatory_variable, response_variable,
                     emoji_code, graph_title, xaxis_label, yaxis_label,
                     num_variable_x_min = 0, num_variable_x_max = 100,
                     num_variable_y_min = 0, num_variable_y_max = 100){

  #ensure the values in variable_filteredOn are found in variable_toFilter
  variable_toFilter_vec <- data |>
    dplyr::pull({{variable_toFilter}})
  if(!(all({{variable_filteredOn}} %in% (variable_toFilter_vec)))){
    stop("The categories listed in the variable_filteredOn variable are not found in the variable_toFilter category.")
  }

  #ensure that the explanatory variable is numeric
  explanatory_variable_vec <- data |>
    dplyr::pull({{explanatory_variable}})
  if(!(is.numeric(explanatory_variable_vec))){
    stop('Explanatory variable needs to be numeric')
  }

  #ensure that the response variable is numeric
  response_variable_vec <- data |>
    dplyr::pull({{response_variable}})
  if(!(is.numeric(response_variable_vec))){
    stop('Response variable needs to be numeric')
  }

  #make sure the inputs for the explanatory_variable and response_variable are unique variables
  if(all(explanatory_variable_vec %in% response_variable_vec)){
    stop("The explantary variable and response variable must be unique variables")
  }


  #filter cat_variable according to cat_filteredOn
  data_filtered_cat <- data |>
    dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}}))

  #make visualization for two numeric variables using emoji icons
  emojiPlot <- ggplot2::ggplot(data = data_filtered_cat,
                  mapping = ggplot2::aes(x = {{explanatory_variable}},
                                         y = {{response_variable}},
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






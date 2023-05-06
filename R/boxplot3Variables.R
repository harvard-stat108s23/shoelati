
#' Create an accessible graph which highlights the changes in price depending on price, type, and brand
#'
#' @param data A data frame.
#' @param cat_variable Categorical variable in the data frame to filter on.
#' @param cat_filteredOn Filter the categorical variable (cat_variable) according to relevant subcategories.
#' @param cat_variable_x Categorical variable to plot on the x-axis of the visualization.
#' @param num_variable_y Numerical variable to plot on the y-axis of the visualization.
#' @param graph_title The graph's label.
#' @param xaxis_label The x-axis's label.
#' @param yaxis_label The y-axis's label.
#'
#' @return A boxplot
#' @export
#'
#' @examples
#' boxplot3Variables(data = shoelati, cat_variable = brand, cat_filteredOn = c("Adidas", "Nike"),
#' cat_variable_x = type, num_variable_y = price_usd,
#' graph_title = "Average Price by Type of Shoe According to Brand",
#' xaxis_label = "Type", yaxis_label = "Price (USD)")
#'


#add in error if inputs are not what I want- numeric


boxplot3Variables <- function(data, cat_variable, cat_filteredOn, cat_variable_x, num_variable_y, graph_title, xaxis_label, yaxis_label){
  #filter for the specific variable we want to examine
  data_filtered_cat <- data |>
    dplyr::filter({{cat_variable}} %in% c({{cat_filteredOn}}))

  #create boxplot to observe relationship between our variables
  boxplot <- ggplot2::ggplot(data = data_filtered_cat, mapping = ggplot2::aes(x = {{cat_variable_x}}, y = {{num_variable_y}}, fill = {{cat_variable}})) +
    ggplot2::geom_boxplot(color = "black") +
    ggplot2::facet_wrap(ggplot2::vars({{cat_variable}})) +
    viridis::scale_fill_viridis(discrete = TRUE) +
    ggplot2::theme(text = ggplot2::element_text(size = 15),
                   axis.text.x = ggplot2::element_text(angle = 45,
                                                       vjust = 1,
                                                       hjust = 1)) +
    ggplot2::labs(title = graph_title,
                  x = xaxis_label,
                  y = yaxis_label) +
    ggplot2::guides(fill = "none")


  return(boxplot)

}



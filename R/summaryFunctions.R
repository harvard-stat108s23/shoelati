
#' Find summary functions for the data.
#'
#' @param data A data frame
#' @param variable_toFilter Numerical or categorical variable in the data frame to filter on.
#' @param variable_filteredOn Filter the numerical or categorical variable (cat_variable) according to relevant subcategories.
#' @param grouped_variable Numerical or categorical variable to plot on the x-axis of the visualization.
#' @param response_variable Numerical variable to plot on the y-axis of the visualization.
#'
#' @return A datatable with the summary functions.
#' @export
#'
#' @examples
#' summaryFunctions(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "Nike"),
#' grouped_variable = size_us, response_variable = price_usd)
#'


summaryFunctions <- function(data, variable_toFilter, variable_filteredOn, grouped_variable, response_variable, title_name){

  #filter cat_variable according to cat_filteredOn
  data_filtered_cat <- data |>
    dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}}))

  #compute summary statistics on a numerical variable grouped by the categorical and another numerical variable
  summarytable <- data_filtered_cat |>
    dplyr::group_by({{variable_toFilter}}, {{grouped_variable}}) |>
    dplyr::summarize(mean_y = mean({{response_variable}}),
                     median_y = median({{response_variable}}),
                     sd_y = sd({{response_variable}}),
                     max_y = max({{response_variable}}),
                     min_y = min({{response_variable}}),
                     count_y = dplyr::n())

  return(summarytable)

}

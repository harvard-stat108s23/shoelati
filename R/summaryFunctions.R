
#' Perform summary functions.
#'
#' Calculates summary functions (mean, median, etc.) for a response variable after grouping or filtering by two specific other variables (either numeric or categorical) to detect trends.
#'
#' @param data A data frame
#' @param variable_toFilter One numeric or categorical variable in the data frame to filter on.
#' @param variable_filteredOn Filter the numeric or categorical variable (variable_toFilter) according to relevant subcategories of interest.
#' @param explanatory_variable One unique numeric or categorical variable to group the data by to better understand the response variable.
#' @param response_variable One numeric variable whose values are analyzed in the context of the explanatory and filtered variable to draw trends in the data.
#' @importFrom stats median
#' @importFrom stats sd
#'
#' @return A datatable with multiple summary functions perfomed on a chosen response variable.    Dimensions depend on the number of categories we have filtered on and the number of values for our explanatory variable.
#' @export
#'
#' @examples
#' summaryFunctions(data = shoelati, variable_toFilter = brand,
#' variable_filteredOn = c("Adidas", "Nike"),
#' explanatory_variable = size_us, response_variable = price_usd)
#'


summaryFunctions <- function(data, variable_toFilter, variable_filteredOn, explanatory_variable, response_variable){

  # ensure that the response variable is numeric
  response_variable_vec <- data |>
    dplyr::pull({{response_variable}})
  if(!(is.numeric(response_variable_vec))){
    stop('Response variable needs to be numeric')
  }

  # ensure that the values in variable_filteredOn are found in variable_toFilter
  variable_toFilter_vec <- data |>
    dplyr::pull({{variable_toFilter}})
  if(!(all({{variable_filteredOn}} %in% (variable_toFilter_vec)))){
    stop("The categories listed in the variable_filteredOn variable are not found in the variable_toFilter category.")
  }

  #ensure that inputs for variable_toFilter and explanatory_variable are unique variables
    explanatory_variable_vec <- data |>
      dplyr::pull({{explanatory_variable}})
    if(all(variable_toFilter_vec %in% explanatory_variable_vec)){
      stop("The variable_toFilter variable and the explanatory_variable variable must be unique inputs.")
    }


  #filter cat_variable according to cat_filteredOn
  data_filtered_cat <- data |>
    dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}}))

  #compute summary statistics on a numeric variable grouped by the categorical and another numeric variable
  summarytable <- data_filtered_cat |>
    dplyr::group_by({{variable_toFilter}}, {{explanatory_variable}}) |>
    dplyr::summarize(mean_resp = mean({{response_variable}}),
                     median_resp = median({{response_variable}}),
                     sd_resp = sd({{response_variable}}),
                     max_resp = max({{response_variable}}),
                     min_resp = min({{response_variable}}),
                     count_resp = dplyr::n())

  return(summarytable)

}

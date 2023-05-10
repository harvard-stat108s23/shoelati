
#'
#' An accessible boxplot according to three variables.
#'
#' Creates an accessible boxplot which highlights the relationship between a numeric variable and two other variables (either numeric or categorical).
#'
#' @inheritParams summaryFunctions
#' @param graph_title The graph's label.
#' @param xaxis_label The x-axis's label.
#' @param yaxis_label The y-axis's label.
#'
#' @return A boxplot highlighting trends according of the variable we have filtered on for by our chosen response and explanatory variables.
#' @export
#'
#' @examples
#' boxplot3Variables(data = shoelati, variable_toFilter = brand,
#' variable_filteredOn = c("Adidas", "Nike"),
#' explanatory_variable = type, response_variable = price_usd,
#' graph_title = "Average Price by Type of Shoe According to Brand",
#' xaxis_label = "Type", yaxis_label = "Price (USD)")
#'
#'


boxplot3Variables <- function(data, variable_toFilter, variable_filteredOn, explanatory_variable, response_variable, graph_title, xaxis_label, yaxis_label){

  #ensure that the response variable is numeric
   response_variable_vec <- data |>
    dplyr::pull({{response_variable}})
  if(!(is.numeric(response_variable_vec))){
    stop('Response variable needs to be numeric')
  }

   #ensure that values in variable_filteredOn are found in variable_toFilter
   variable_toFilter_vec <- data |>
     dplyr::pull({{variable_toFilter}})
   if(!(all({{variable_filteredOn}} %in% (variable_toFilter_vec)))){
     stop("The categories listed in the variable_filteredOn variable are not found in the variable_toFilter category.")
   }

   #make sure the inputs for variable_toFilter and explanatory_variable are unique variables
   explanatory_variable_vec <- data |>
     dplyr::pull({{explanatory_variable}})
   if(all(variable_toFilter_vec %in% explanatory_variable_vec)){
     stop("The variable_toFilter variable and the explanatory_variable variable must be unique inputs.")
   }

   #make sure that the variable_toFilter is categorical
   if((is.numeric(variable_toFilter_vec))){
     stop("Please insert a categorical variable for the variable to filter by so that the color can
          take on discrete values in scale_fill_viridis(discrete = TRUE)")
   }

  #filter cat_variable according to cat_filteredOn
   data_filtered_cat <- data |>
     dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}}))

  #create boxplot to observe relationship between our variables
  boxplot <- ggplot2::ggplot(data = data_filtered_cat, mapping = ggplot2::aes(x = {{explanatory_variable}}, y = {{response_variable}}, fill = {{variable_toFilter}})) +
    ggplot2::geom_boxplot(color = "brown2") +
    ggplot2::facet_wrap(ggplot2::vars({{variable_toFilter}})) +
    ggplot2::theme(text = ggplot2::element_text(size = 15),
                   axis.text.x = ggplot2::element_text(angle = 45,
                                                       vjust = 1,
                                                       hjust = 1)) +
    ggplot2::labs(title = graph_title,
                  x = xaxis_label,
                  y = yaxis_label,
                  caption = "The colors denote the different shoe brands.") +
    ggplot2::guides(fill = "none") +
    viridis::scale_fill_viridis(discrete = TRUE)

  return(boxplot)
}




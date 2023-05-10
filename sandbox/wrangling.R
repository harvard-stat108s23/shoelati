library(tidyverse)

Shoe_prices <- read_csv("data-raw/Shoe prices.csv") %>%
  mutate(Size = str_remove(Size, "US "),
         `Price (USD)` = str_remove(`Price (USD)`, "\\$")) %>%
  mutate(Size = as.numeric(Size),
         `Price (USD)` = as.numeric(`Price (USD)`)) %>%
  rename(`Size (US)` = Size)


Shoe_prices_1 <- Shoe_prices %>%
  count(Brand, Model) %>%
  arrange(desc(n))

Shoe_prices_2 <- Shoe_prices %>%
  filter(Brand == "Vans",
         Model == "Era")


ggplot(data = Shoe_prices, mapping = aes(x = Brand, y = `Price (USD)`,
                                         fill = Brand)) +
  facet_wrap(~Gender) +
  viridis::scale_fill_viridis(discrete = TRUE) +
  geom_boxplot()


Shoe_prices_3 <- Shoe_prices %>%
  filter(Brand %in% c("Adidas"))

ggplot(data = Shoe_prices_3, mapping = aes(x = Type, y = `Price (USD)`, color = Brand)) +
  viridis::scale_color_viridis(discrete = TRUE) +
  geom_boxplot()


brandPrices <- function(data, x, brands){
  #filter for the specific brand we want to examine
  dataBrands <- data |>
    filter({{x}} %in% c({{brands}}))
}

brandPrices(data = Shoe_prices, x = Brand, brands = "Adidas")








brandPrices <- function(data, brand, brands_listed, x_axis, y_axis, title_name){
#filter for the specific brand we want to examine
dataBrands <- data |>
  dplyr::filter({{brand}} %in% c({{brands_listed}}))

#create boxplot to observe relationship between brand and price according to shoe type
boxplot <- ggplot2::ggplot(data = dataBrands, mapping = ggplot2::aes(x = {{x_axis}}, y = {{y_axis}}, fill = {{brand}})) +
  ggplot2::geom_boxplot(color = "black") +
  ggplot2::facet_wrap(ggplot2::vars({{brand}})) +
  viridis::scale_fill_viridis(discrete = TRUE) +
  ggplot2::theme(text = ggplot2::element_text(size = 15),
                 axis.text.x = ggplot2::element_text(angle = 45,
                                            vjust = 1,
                                            hjust = 1)) +
  ggplot2::labs(title = title_name) +
  ggplot2::guides(fill = "none")

#summary statistics concerning chart
summarytable <- dataBrands |>
  dplyr::group_by({{brand}}, {{x_axis}}) |>
  dplyr::summarize(mean_y = mean({{y_axis}}))

return(list(boxplot, summarytable))

}

brandPrices(data = shoeLati, brand = Brand, brands_listed = c("Adidas", "Nike"),
            x_axis = Type, y_axis = `Price (USD)`,
            title = "Average Price by Type of Shoe According to Brand ")







function_1 <- function(data, variable, v2){

  pulling <- data |>
    dplyr::pull({{variable}})
  pulling_2 <- data |>
    dplyr::pull({{v2}})

  if(all(pulling_2 %in% pulling)){
  stop("name")
}}

function_1(data = shoelati, variable = size_us, v2 = size_us)





#Fixed
function_2 <- function(data, variable_toFilter, variable_filteredOn){

  resp_var_vec <- data |>
    dplyr::pull({{variable_toFilter}})

  if(!(all({{variable_filteredOn}} %in% (resp_var_vec)))){
    stop("fix")
  }
}

function_2(data = shoelati, variable_toFilter = brand, variable_filteredOn = c("Adidas", "hello"))





function_3(data = shoelati, variable = type )





boxplot3Variables <- function(data, variable_toFilter, variable_filteredOn, explanatory_variable, response_variable, graph_title, xaxis_label, yaxis_label){

  #determine if the response variable is numerical
  resp_var_vec <- data |>
    dplyr::pull({{response_variable}})
  if(!(is.numeric(resp_var_vec))){
    stop('Response variable needs to be quantitative')
  }

  #determine if the values in variable_filteredOn are found in variable_toFilter
  variable_toFilter_vec <- data |>
    dplyr::pull({{variable_toFilter}})
  if(!(all({{variable_filteredOn}} %in% (variable_toFilter_vec)))){
    stop("The categories listed in the variable_filteredOn variable are not found in the variable_toFilter category.")
  }

  # make sure the inputs for variable_toFilter and explanatory_variable are unique variables
  explanatory_variable_vec <- data |>
    dplyr::pull({{explanatory_variable}})
  if(all(variable_toFilter_vec %in% explanatory_variable_vec)){
    stop("The variable_toFilter variable and the explanatory_variable variable must be unique inputs.")
  }

  #fix
  #filter for the specific variable we want to examine
  # data_filtered_cat <- data |>
  # dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}})) |>
  #  dplyr::mutate(discrete_value = dplyr::case_when(
  #    is.character({{variable_toFilter}}) ~ TRUE,
  #   is.numeric({{variable_toFilter}}) ~ FALSE)
  #   )

  #filter cat_variable according to cat_filteredOn
  data_filtered_cat <- data |>
    dplyr::filter({{variable_toFilter}} %in% c({{variable_filteredOn}})) |>
    dplyr::group_by({{variable_toFilter}}, {{explanatory_variable}}) |>
    dplyr::mutate(mean_resp = mean({{response_variable}}))

  #create boxplot to observe relationship between our variables
  boxplot <- ggplot2::ggplot(data = data_filtered_cat, mapping = ggplot2::aes(x = {{explanatory_variable}}, y = {{response_variable}}, fill = {{variable_toFilter}})) +
    ggplot2::geom_boxplot(color = "black") +
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
    viridis::scale_fill_viridis(discrete = TRUE) +
    ggplot2::geom_contour(z = mean_resp)

  return(boxplot)
}

boxplot3Variables(data = shoelati, variable_toFilter = brand,
                  variable_filteredOn = c("Adidas", "Nike"),
                  explanatory_variable = type, response_variable = price_usd,
                  graph_title = "Average Price by Type of Shoe According to Gender",
                  xaxis_label = "Type", yaxis_label = "Price (USD)")





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




















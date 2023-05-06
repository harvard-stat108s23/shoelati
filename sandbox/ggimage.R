

#create graph
dataX <- shoelati |>
  dplyr::filter(brand == "Vans")


ggplot2::ggplot(data = dataX, mapping = ggplot2::aes(x  = size_us, y = price_usd, image = emoji)) +
  ggimage::geom_emoji(position = ggplot2::position_jitter(width = 3, height = 3)) +
  ggplot2::xlim(6, 12) +
  ggplot2::ylim(25, 250) +


  ggplot2::labs(title = "Shoe Price According to Shoe Size",
                caption = "This visualization uses emojis as its geom.",
                x = "Size (US)",
                y = "Price (USD)")





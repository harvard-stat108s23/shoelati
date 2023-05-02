## code to prepare `DATASET` dataset goes here

shoelati <- readr::read_csv("data-raw/Shoe prices.csv") |>
  dplyr::mutate(Size = stringr::str_remove(Size, "US "),
         `Price (USD)` = stringr::str_remove(`Price (USD)`, "\\$")) |>
  dplyr::mutate(Size = as.numeric(Size),
         `Price (USD)` = as.numeric(`Price (USD)`)) |>
  dplyr::rename(`Size (US)` = Size) |>
  dplyr::mutate(Type = stringr::str_to_lower(Type)) |>
  dplyr::mutate(General_type = dplyr::case_when(
  Type %in% c("basketball", "cross-training", "crossfit", "running", "trail running", "training", "weightlifting", "racing") ~ "work-out",
  Type %in% c("casual", "lifestyle", "walking", "retro") ~ "everyday",
  Type %in% c("fashion") ~ "fashion",
  Type %in% c("hiking", "trail") ~ "trail",
  Type %in% c("slides") ~ "slides",
  Type %in% c("skate") ~ "roller-skate"
))

shoemojis <- data.frame(
  General_type = c("work-out", "everyday", "fashion", "trail", "slides", "roller-skate"),
  Emoji = c("1F45F", "1F97F", "1F460", "1F97E", "1FA74", "1F6FC"))

shoelati <- dplyr::left_join(shoelati, shoemojis)


usethis::use_data(shoelati, overwrite = TRUE)

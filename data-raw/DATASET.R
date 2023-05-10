
## wrangle pre-existing data to make shoelati

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
  Type %in% c("skate") ~ "skates"
))

shoemojis <- data.frame(
  General_type = c("work-out", "everyday", "fashion", "trail", "slides", "skates"),
  Emoji = c("1f45f", "1f97f", "1f460", "1f97e", "1f461", "26f8"))

shoelati <- dplyr::left_join(shoelati, shoemojis) |>
  janitor::clean_names()


usethis::use_data(shoelati, overwrite = TRUE)


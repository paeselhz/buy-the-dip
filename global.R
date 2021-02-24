library(dplyr)
library(shiny)
library(plotly)
library(formattable)
library(shinyWidgets)

source('function/generate_drop_data.R')

stock_prices_ibov <-
  readr::read_rds('data/stock_prices_ibov.rds')

purrr::walk(
  list.files('ui/', full.names = TRUE),
  ~source(.x)
)

formattable_formatter <-
  formatter(
    "span",
    style = x ~ ifelse(x > 0,
                       style(color = 'green', font.weight = "bold"),
                       style(color = 'red', font.weight = "bold")),
    x ~ icontext(ifelse(x > 0, "arrow-up", "arrow-down"), x)
  )

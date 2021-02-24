library(dplyr)
library(shiny)
library(plotly)
library(shinyWidgets)

stock_prices_ibov <-
  readr::read_rds('data/stock_prices_ibov.rds')

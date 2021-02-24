
ticker_objects <- reactive({
  
  input_index <- input$selected_ticker
  
  return(generate_falling_stock_data(input_index))
  
})

output$formattable_ticker <-
  renderFormattable({
    
    ticker_objects()$returns_df %>% 
      dplyr::mutate(
        symbol = stringr::str_remove(symbol, "\\.SA"),
        fall_date = format(fall_date, "%d/%m/%Y")
      ) %>% 
      mutate_if(is.numeric, ~round(., digits = 2)) %>% 
      select(
        # Ticker = symbol,
        `Dia da Queda` = fall_date,
        `Queda` = fall_quantity,
        `t1` = t_1,
        `t7` = t_7,
        `t30` = t_30,
        `t90` = t_90,
        `t180` = t_180,
        `t360` = t_360,
        `t720` = t_720,
      ) %>% 
      formattable(
        align = "c",
        list(
          Queda = formattable_formatter,
          t1 = formattable_formatter,
          t7 = formattable_formatter,
          t30 = formattable_formatter,
          t90 = formattable_formatter,
          t180 = formattable_formatter,
          t360 = formattable_formatter,
          t720 = formattable_formatter
        )
      )
    
  })

output$plotly_ticker <-
  renderPlotly({
    
    ticker_objects()$plotly
    
  })

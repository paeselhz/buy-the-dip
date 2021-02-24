library(dplyr)
library(plotly)

generate_falling_stock_data <-
  function(selected_ticker) {
      
    top_10_drops <-
      stock_prices_ibov %>% 
      filter(
        symbol == selected_ticker
      ) %>% 
      arrange(daily_return) %>% 
      head(10)
    
    base_plot <-
      plot_ly()
    
    returns_df <-
      tibble::tibble()
    
    for(i in 1:nrow(top_10_drops)) {
      
      fall <-
        top_10_drops[i, ]
      
      returns_after_fall <-
        stock_prices_ibov %>% 
        filter(date > fall$date &
                 !is.na(daily_return) &
                 symbol == selected_ticker) %>% 
        mutate(
          fall_date = fall$date,
          fall_quantity = fall$daily_return,
          cumulative_return = cumsum(daily_return),
          days_since = order(date)
        ) %>% 
        filter(
          days_since <= 720
        ) %>% mutate(
          text = paste0(
            date, "<br>",
            days_since, "<br>",
            cumulative_return, "<br>"
          )
        )
      
      base_plot <-
        base_plot %>% 
        add_trace(
          data = returns_after_fall,
          x = ~days_since,
          y = ~cumulative_return,
          name = ~fall_date,
          color = ~fall_date,
          mode = "lines",
          type = "scatter",
          text = ~text,
          hovertemplate = paste('%{text}')
        )
      
      returns_df <-
        bind_rows(
          returns_df,
          returns_after_fall %>% 
            filter(
              days_since %in% c(1, 7, 30, 90, 180, 360, 720)
            ) %>% 
            select(symbol,
                   fall_date,
                   fall_quantity,
                   cumulative_return,
                   days_since) %>% 
            tidyr::pivot_wider(names_from = days_since,
                               names_prefix = "t_",
                               values_from = cumulative_return)
        )
      
    }
    
    lst_return <-
      list(
        plotly = base_plot,
        returns_df = returns_df
      )
    
  }

home_tab <-
  tabPanel(
    title = "Home",
    value = "home",
    hr(),
    column(width = 12,
           h1("Buy The Dip!"),
           style = 'text-align: center;'),
    br(),
    column(width = 12,
           # h3(
           HTML(
             paste0(
               "<h3 style='text-align: center; line-height: inherit;'>",
               "Esse app foi inspirado no tweet do ", 
               a("@j_felicio1", href = "https://twitter.com/j_felicio1/status/1363917883290640386?s=19", target = "_blank"), 
               " sobre como se comportaram os retornos de PETR4 após grandes quedas.",
               " Pensando nisso, busquei as 10 ações de maior peso no Ibovespa, para analisar como se comportam",
               " seus retornos após quedas significativas, olhando como essas ações se comportaram em 1, 7, 30, 90, 180, 360 e 720",
               " pregões depois (utilizei o numero de pregões ao invés do numero de dias para desconsiderar finais de semana, por isso ",
               " alguns dados podem diferir de outras análises).",
               "</h3>"
             )
           )
    ),
    br(),
    column(
      width = 12,
      radioGroupButtons(
        inputId = "selected_ticker",
        choices = stock_prices_ibov$symbol %>% unique(),
        individual = TRUE,
        checkIcon = list(
          yes = tags$i(class = "fa fa-circle", 
                       style = "color: #6aae7a"),
          no = tags$i(class = "fa fa-circle-o", 
                      style = "color: #6aae7a"))
      ),
      style = 'text-align: center;'
    ),
    column(
      width = 12,
      column(
        width = 6,
        # formattableOutput('formattable_ticker')
        dataTableOutput('formattable_ticker')
      ),
      column(
        width = 6,
        plotlyOutput('plotly_ticker')
      )
    ),
    br(),
    br(),
    column(
      width = 12,
      HTML(
        '<h4><strong>Sobre o desenvolvedor: </strong></h4>'
      ),  
      h3(
        a(
          href = "https://paeselhz.github.io/",
          icon("globe"),
          target = "_blank"
        ),
        a(
          href = "https://linkedin.com/in/lhzpaese",
          icon("linkedin"),
          target = "_blank"
        ),
        a(
          href = "https://github.com/paeselhz",
          icon("github"),
          target = "_blank"
        ),
        a(
          href = "https://twitter.com/paeselhz",
          icon("twitter"),
          target = "_blank"
        )
      )
    )
  )
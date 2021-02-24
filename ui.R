shinyUI(
  fluidPage(
    ##-- Favicon ----
    tags$head(
      #-- biblio js ----
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    ##-- Logo ----
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle = "Shiny Test WebApp - New Version"
        )
    ),
    theme = "styles.css",
    title = "",
    id = "home",
    fluid = TRUE,
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
                 " seus retornos após quedas significativas, olhando como essas ações se comportaram em 1, 7, 30, 60, 90, 180, 360 e 720",
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
                         style = "color: steelblue"),
            no = tags$i(class = "fa fa-circle-o", 
                        style = "color: steelblue"))
        ),
        style = 'text-align: center;'
      ),
      column(
        width = 12,
        column(
          width = 6,
          
        ),
        column(
          width = 6
        )
      ),
      column(
        width = 12,
        'App gerado pelo paese'
      )
    )
    
  )
)

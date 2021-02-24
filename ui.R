shinyUI(
  fluidPage(
    ##-- Favicon ----
    tags$head(
      tags$link(rel = "shortcut icon", href = "img/logo.ico"),
      #-- biblio js ----
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    ##-- Logo ----
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle = "Buy The Dip!"
        )
    ),
    theme = "styles.css",
    title = "",
    id = "home",
    fluid = TRUE,
    home_tab
  )
)

library(shiny)
shinyServer(function(input, output, session) {
  
  purrr::walk(
    list.files('server/', full.names = TRUE),
    ~source(.x, local = TRUE)
  )
  
})
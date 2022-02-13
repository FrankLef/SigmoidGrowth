#' curve UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_curve_ui <- function(id){
  ns <- NS(id)
  tagList(
    column(12, plotOutput(ns("curve")))
  )
}
    
#' curve Server Functions
#'
#' @noRd 
mod_curve_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$curve <- renderPlot({
      shinipsum::random_ggplot("line")
    })
  })
}
    
## To be copied in the UI
# mod_curve_ui("curve_ui_1")
    
## To be copied in the server
# mod_curve_server("curve_ui_1")

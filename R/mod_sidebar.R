#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id){
  ns <- NS(id)
  tagList(
    # model selection
    selectInput("model", label = "Model", 
                choices = c("Gompertz", "Logistic", "Monomolecular"),
                selected = "Logistic"),
    # Total time
    numericInput("N", "Total time", value = 100),
    # Time step
    sliderInput("dt", label = "Time step", 
                value = 10, min = 1, max = 100, step = 1),
    # nb of replicates
    sliderInput("n", label = "nb of replicates", 
                value = 30, min = 1, max = 100, step = 1),
    sliderInput("Nrng", label = "Time range", 
                value = c(80, 100), min = 1, max = 100, step = 1),
    # run the simulation again
    actionButton("sim", "Simulate"),
    # reset to default values
    actionButton("reset", "Reset")
  )
}
    
#' sidebar Server Functions
#'
#' @noRd 
mod_sidebar_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# mod_sidebar_server("sidebar_ui_1")

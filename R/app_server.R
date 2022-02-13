#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  mod_sigmoid_server("sigmoid_ui_1")
  mod_sigmoid_server("sigmoid_ui_2")
  mod_curve_server("curve_ui_1")
  mod_curve_server("curve_ui_2")
  mod_sidebar_server("sidebar_ui_1")
}

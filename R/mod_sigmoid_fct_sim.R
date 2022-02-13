sim_sigmoid <- function(process = c("predict", "random"),
                        model = c("Logistic", "Gompertz", "Monomolecular"),
                        prms = list(N = 100, dt = 10, y0 = 0.01, r = 0.1, 
                                    K = 1, n = 9, alpha = 0.2),
                        decay = 25, hscedasticity = FALSE,
                        probs = c(0.05, 0.95)) {
  
  process <- match.arg(process)
  model <- match.arg(model)
  
  # lst_random <- sim_random(model = model, prms = prms, probs = probs)
  # 
  # lst <- list()
  # if (stochastic == "predict") {
  #   lst <- sim_predict(df = lst_random$df, n = prms$n, decay = decay, 
  #                      hscedasticity = hscedasticity, probs = probs)
  # } else if (stochastic == "random")  {
  #   lst <- lst_random
  # } else {
  #   stop("Invalid stochastic")
  # }
  
  out <- list("process" = process, "model" = model)
  
  out
}

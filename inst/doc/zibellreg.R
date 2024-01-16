## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bellreg)

data(cells)

# ML approach:
mle <- zibellreg(cells ~ smoker+gender|smoker+gender, data = cells, approach = "mle")
summary(mle)

# Bayesian approach:
bayes <- zibellreg(cells ~ 1|smoker+gender, data = cells, approach = "bayes", refresh = FALSE)
summary(bayes)

log_lik <- loo::extract_log_lik(bayes$fit)
loo::loo(log_lik)
loo::waic(log_lik)



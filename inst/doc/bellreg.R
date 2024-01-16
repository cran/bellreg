## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bellreg)

data(faults)

# ML approach:
mle <- bellreg(nf ~ lroll, data = faults, approach = "mle")
summary(mle)

# Bayesian approach:
bayes <- bellreg(nf ~ lroll, data = faults, approach = "bayes", refresh = FALSE)
summary(bayes)

log_lik <- loo::extract_log_lik(bayes$fit)
loo::loo(log_lik)
loo::waic(log_lik)


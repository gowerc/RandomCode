#
#
# Small example to show the how performance is affected by using the centered/non-centered
# parameterisations in Stan. Also want to demonstrate their affine transformation helper
# syntax to make converting between centered/non-centered easier
#
#


library(cmdstanr)
library(posterior)
library(bayesplot)
library(dplyr)
library(tidyr)


N_obs_per_pt <- 12
N_pt <- 300
mu <- 50
sigma <- 3
omega <- 5

baseline_pt <- tibble(
    pt = sprintf("pt_%05d", 1:N_pt),
    mu_pt = rnorm(N_pt, mu, omega)
)

dat <- crossing(
    pt = baseline_pt$pt,
    obs_index = seq_len(N_obs_per_pt)
) |>
    left_join(baseline_pt, by = "pt") |>
    mutate(outcome = rnorm(n(), mu_pt, sigma)) |>
    mutate(pt = factor(pt))


stan_data <- list(
    n_obs = nrow(dat),
    n_pt = N_pt,
    outcome = dat$outcome,
    pt_index = dat$pt
)

# Centered parameterisation
mod1 <- cmdstan_model(
    stan_file = cmdstanr::write_stan_file("
        data {
            int<lower=1> n_obs;
            int<lower=1> n_pt;
            vector[n_obs] outcome;
            array[n_obs] int<lower=1> pt_index;
        }
        parameters {
            real mu;
            real<lower=0> sigma;
            real<lower=0> omega;  // hyperparameter variance for random effects
            vector[n_pt] mu_pt;
        }
        transformed parameters {
            vector[n_obs] mu_pt_obs = mu_pt[pt_index];
        }
        model {
            omega ~ lognormal(log(1), 1);
            sigma ~ lognormal(log(2), 1);
            mu ~ normal(0, 10);
            mu_pt ~ normal(mu, omega);
            outcome ~ normal(mu_pt_obs, sigma);
        }
    ")
)

# Non-centered parameterisation
mod2 <- cmdstan_model(
    stan_file = cmdstanr::write_stan_file("
        data {
            int<lower=1> n_obs;
            int<lower=1> n_pt;
            vector[n_obs] outcome;
            array[n_obs] int<lower=1> pt_index;
        }
        parameters {
            real mu;
            real<lower=0> sigma;
            real<lower=0> omega;  // hyperparameter variance for random effects
            vector[n_pt] mu_eta_pt;
        }
        transformed parameters {
            vector[n_obs] mu_pt_obs = mu + mu_eta_pt[pt_index] .* omega;
        }
        model {
            omega ~ lognormal(log(1), 1);
            sigma ~ lognormal(log(2), 1);
            mu ~ normal(0, 10);
            mu_eta_pt ~ std_normal();
            outcome ~ normal(mu_pt_obs, sigma);
        }
    ")
)

# Non-centered parameterisation with affine transformation
mod3 <- cmdstan_model(
    stan_file = cmdstanr::write_stan_file("
        data {
            int<lower=1> n_obs;
            int<lower=1> n_pt;
            vector[n_obs] outcome;
            array[n_obs] int<lower=1> pt_index;
        }
        parameters {
            real mu;
            real<lower=0> sigma;
            real<lower=0> omega;  // hyperparameter variance for random effects
            vector<offset=mu, multiplier=omega>[n_pt] mu_pt;
        }
        transformed parameters {
            vector[n_obs] mu_pt_obs = mu_pt[pt_index];
        }
        model {
            omega ~ lognormal(log(1), 1);
            sigma ~ lognormal(log(2), 1);
            mu ~ normal(0, 10);
            mu_pt ~ normal(mu, omega);
            outcome ~ normal(mu_pt_obs, sigma);
        }
    ")
)




opts <- list(
    data = stan_data,
    chains = 2,
    parallel_chains = 2,
    refresh = 200,
    iter_warmup = 1000,
    iter_sampling = 2000
)

fit1 <- do.call(mod1$sample, opts)
fit2 <- do.call(mod2$sample, opts)
fit3 <- do.call(mod3$sample, opts)


sfit1 <- fit1$summary() |> print()
sfit2 <- fit2$summary() |> print()
sfit3 <- fit3$summary() |> print()


## Diagnostics
plot(
    sfit1 |> filter(grepl("mu_pt\\[.*\\]", variable)) |> pull(mean),
    baseline_pt$mu_pt
)
plot(
    sfit2[ sfit2$variable == "mu", "mean"]$mean + (sfit2 |> filter(grepl("mu_eta_pt\\[.*\\]", variable))|> pull(mean)),
    baseline_pt$mu_pt
)
plot(
    fit3$summary() |> filter(grepl("mu_pt\\[.*\\]", variable)) |> pull(mean),
    baseline_pt$mu_pt
)


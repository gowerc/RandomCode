
#
#
# Small example to show the truncation syntax of Rstan `lognormal(log(2), 1) T[0, ]`
# but then also check to see if there is any performance differences between
# using the truncation syntax vs not using it (particularly on cases where its not needed
# e.g. T[0, ] on a strictly positive distribution
#
#


library(cmdstanr)
library(posterior)
library(bayesplot)

mod <- cmdstan_model(
    stan_file = cmdstanr::write_stan_file("
        data {
            int<lower=1> n;
            vector[n] x;
        }
        parameters {
            real mu_x;
            real<lower=0> sigma_x;
        }
        model {
            sigma_x ~ lognormal(log(2), 1);
            mu_x ~ normal(0, 10);
            target += normal_lpdf(x | mu_x, sigma_x);
        }
    ")
)

mod2 <- cmdstan_model(
    stan_file = cmdstanr::write_stan_file("
        data {
            int<lower=1> n;
            vector[n] x;
        }
        parameters {
            real mu_x;
            real<lower=0> sigma_x;
        }
        model {
            sigma_x ~ lognormal(log(2), 1) T[0, ];
            mu_x ~ normal(0, 10);
            target += normal_lpdf(x | mu_x, sigma_x);
        }
    ")
)

stan_data <- list(
    n = 50000,
    x = rnorm(50000, 5, 2)
)
fit <- mod$sample(
    data = stan_data,
    chains = 2,
    parallel_chains = 2,
    refresh = 200,
    iter_warmup = 1000,
    iter_sampling = 2000
)

fit2 <- mod2$sample(
    data = stan_data,
    chains = 2,
    parallel_chains = 2,
    refresh = 200,
    iter_warmup = 1000,
    iter_sampling = 2000
)



fit$summary()
fit2$summary()


######################
#
# Diagnostics
#
#

samps <- fit$draws(c("mu_x", "sigma_x"))

mcmc_pairs(samps)    # pairs
mcmc_trace(samps)    # trace
mcmc_areas(samps)    # density (same axis)
mcmc_dens(samps)     # density (individual)
mcmc_acf_bar(samps)  # auto correlation - bar
mcmc_acf(samps)      # auto correlation - line
mcmc_hex(samps)      # Joint distribution
mcmc_scatter(samps)  # Joint distribution (kinda)
mcmc_combo(samps)    # Density + trace
mcmc_violin(samps)   # violin plot per chain


######################
#
# Extract Samples
#
#

## Convert samples to matrix
as_draws_matrix(fit$draws(c("mu_x", "sigma_x")))

## Convert samples to dataframe
as_draws_df(fit$draws(c("mu_x", "sigma_x")))



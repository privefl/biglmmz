% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/biglmmz.R
\name{biglmmz}
\alias{biglmmz}
\title{(depreciated) Fit a low-rank LMM on normalized genotypes.}
\usage{
biglmmz(
  y,
  X,
  Z,
  M,
  cols,
  backingfile = tempfile(),
  copy_Z = TRUE,
  K = NULL,
  scale = FALSE,
  impute = FALSE,
  REML = TRUE,
  compute_K = TRUE,
  store_mat = FALSE,
  verbose = 0
)
}
\arguments{
\item{y}{A vector of trait values (quantitative trait).}

\item{X}{A matrix of covariates. The default value is matrix of ones
for the intercept (one column).}

\item{Z}{A matrix of genotypes, that can be raw genotypes or normalized genotypes for the GRM.
Missing values can be imputed by genotype means.
The matrix can be either the standard R matrix or FBM.
In the process of model fitting, the matrix Z is copied to a FBM matrix
(that requires additional resources for storage on disk).}

\item{M}{A scalar for normalization of the
genetic relationship matrix: GRM = Z'Z / M,
where Z is a matrix of standardized genotypes.
If M is missing, M = length(cols).}

\item{cols}{A vector of columns of Z to be used in the model.
By default, all columns of Z are used.}

\item{backingfile}{The path to a file where the matrix of standardized genotypes
(internal to the function) is to be stored.
By default, backingfile = tempfile().}

\item{copy_Z}{(advanced) A boolean indicating whether the input matrix Z
is ready for analysis or need to be copied.
By default, copy_Z = TRUE.}

\item{K}{A matrix with the pre-computed cross-product Z'Z / M.
By default, K = NULL, that means K is pre-computed inside the function.}

\item{scale}{Scale genotypes in Z? By default, scale = FALSE.}

\item{impute}{Impute genotypes in Z by genotype means? By default, impute = FALSE.}

\item{REML}{A boolean specifying the likelihood function, REML or ML.}

\item{compute_K}{(advanced) Compute K?  The default value is TRUE.}

\item{store_mat}{(advanced) Store matrices? The default value is FALSE.}

\item{verbose}{The verbose level. The default value is 0 (verbose).}
}
\description{
This function requires more resources
to store the matrix of standardized genotypes
in comparison to the function biglmmg.
The two functions biglmmz and biglmmg perform the same model fitting,
but biglmmg is recommended.
}
\details{
The linear mixed model (LMM) is:
y_i =  X_i b + u_i + e_i, where

u ~ N(0, s2*h2*G) and e ~ N(0, s2 I)

var(y) = V = s2 * (h2*G + I)
}
\examples{
G <- attach_example200() # load simulated genotypes
G
G[1:5, 1:10]

y <- rnorm(nrow(G)) # generate a random phenotype
head(y)

mod <- biglmmz(y, Z = G, scale = TRUE)
mod$gamma # estimated h2

}

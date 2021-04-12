#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

f <- function(n) { return(1.0/n) }
g <- function(n) { return(sin(n)) }

DirichletConvolve <- function(f, g, k) {
    sum = 0
    for (i in (1:k)[!k%%1:k]) { 
        sum = sum + f(i)*g(k/i)
    }
    sum
}

test <- function(k) {
    start <- Sys.time()
    a <- DirichletConvolve(f,g,k)
    end <- Sys.time()
    as.numeric(difftime(end, start))
}

cat(test(strtoi(args[1])), sep='', end='')




#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

f <- function(n) { return(1.0/n) }
g <- function(n) { return(sin(n)) }

DirichletConvolve <- function(f, g, k) {
    sum = 0;
    i = 1;
    while (i * i <= k) {
        if (k %% i == 0) {
            sum = sum + f(i)*g(k/i);
            if (i * i != k) {
                sum = sum + f(k/i)*g(i);
            }
        }
        i = i + 1;
    }
    sum
}

test <- function(k) {
    start <- Sys.time()
    a <- DirichletConvolve(f,g,k)
    end <- Sys.time()
    as.numeric(difftime(end, start))*1000.0
}

specify_decimal <- function(x, k) trimws(format(round(x, k), nsmall=k))

#print(DirichletConvolve(f,g,4))
#print(DirichletConvolve(f,g,2137))
options(digits=6)
cat(specify_decimal(test(strtoi(args[1])),6), sep='', end='')




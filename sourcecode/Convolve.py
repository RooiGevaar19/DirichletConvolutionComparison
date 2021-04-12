import math
import time
import sys

def fix(a):
    return "{:.6f}".format(a)

def f(n):
    return 1.0/n

def g(n):
    return math.sin(n)

def convolve(f,g,n):
    sum = 0.0
    for d in range(1, n+1):
        if (n % d == 0):
            sum += f(d)*g(n//d)
    return sum

def convolve2(f,g,n):
    sum = 0.0
    for d in range(1, math.trunc(math.sqrt(n+1))):
        if (n % d == 0):
            sum += f(d)*g(n//d)
            if (d * d != n):
                 sum += f(n//d)*g(d)
    return sum


def convolve3(f,g,n):
    return sum(f(d)*g(n//d) for d in range(1,n+1) if 1>n%d)

def test(k):
    start = time.time_ns()
    a = convolve(f,g,k)
    end = time.time_ns()
    return fix((end-start)/1000000.0)

def test2(k):
    start = time.time_ns()
    a = convolve2(f,g,k)
    end = time.time_ns()
    return fix((end-start)/1000000.0)

def test3(k):
    start = time.time_ns()
    a = convolve3(f,g,k)
    end = time.time_ns()
    return fix((end-start)/1000000.0)

if __name__ == '__main__':
    k = int(sys.argv[1])
    print(test(k), test2(k), test3(k), end='', sep='\t')



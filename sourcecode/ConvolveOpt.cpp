#include <iostream>
#include <cmath>
#include <bits/stdc++.h>

using std::cout;
using std::setprecision;
using std::fixed;

class Timer
{
    public:
        Timer() { clock_gettime(CLOCK_REALTIME, &beg_); }
    
        double elapsed() {
            clock_gettime(CLOCK_REALTIME, &end_);
            return end_.tv_sec - beg_.tv_sec +
                (end_.tv_nsec - beg_.tv_nsec) / 1000000000.;
        }
    
        void reset() { clock_gettime(CLOCK_REALTIME, &beg_); }
    
    private:
        timespec beg_, end_;
};

double f(long int n) {
    return 1/n;
}

double g(long int n) {
    return sin(n);
}

double convolve(long int k) {
    double sum = 0.0;
    for (long int i = 1; i*i <= k; i++) {
        if (i < 0) break;
        if (k % i == 0) {
            sum += f(i) * g(k/i);
            if (i*i != k) sum += f(k/i) * g(i);
        }
    }
    return sum;
}

double doTest(int k) {
    double a;
    Timer t;
    t.reset();
    a = convolve(k);
    return t.elapsed()*1000.0;
}

int main(int argc, char** argv) {
	cout << setprecision(6) << fixed << doTest(atoi(argv[1]));
	return 0;
}

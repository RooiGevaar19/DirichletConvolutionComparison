import java.lang.Math;
import java.util.Locale;

public class Convolve {
    static void write(String... text) {
        for (String item : text) {
            System.out.print(item);
        }
    }

    static void writeln(String... text) {
        for (String item : text) {
            System.out.print(item);
        }
        System.out.println();
    }

    static long StrToInt(String a) {
        return Integer.parseInt(a);
    }

    static double f(long n) {
        return 1/n;
    }
    
    static double g(long n) {
        return Math.sin(n);
    }
    
    static double convolve(long k) {
        double sum = 0.0;
        for (long i = 1L; i <= k; i++) {
            if (k % i == 0L) {
                sum += f(i) * g(k/i);
            }
        }
        return sum;
    }

    static double convolveOpt(long k) {
        double sum = 0.0;
        for (long i = 1L; i*i <= k; i++) {
            if (k % i == 0L) {
                sum += f(i) * g(k/i);
                if (i*i != k) sum += f(k/i) * g(i);
            }
        }
        return sum;
    }

    static double test(long k) {
        long startTime = System.nanoTime(); 
        double a = convolve(k);
        long estimatedTime = System.nanoTime() - startTime;
        return estimatedTime / 1000000.0;
    }

    static double test2(long k) {
        long startTime = System.nanoTime(); 
        double a = convolveOpt(k);
        long estimatedTime = System.nanoTime() - startTime;
        return estimatedTime / 1000000.0;
    }

    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        //write(Double.toString(), "\t", Double.toString(test2(StrToInt(args[0]))));
        write(String.format("%.6f", test(StrToInt(args[0]))), "\t", String.format("%.6f", test2(StrToInt(args[0]))));
    }
}
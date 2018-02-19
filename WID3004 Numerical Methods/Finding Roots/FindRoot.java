
/**
 *
 * @author JA
 */
public class FindRoot {

    private static int decimal_points = 7;
    private static double precision;

    public static void main(String[] args) {
        double x = 1092839058;
        int n = 3;
        long a, b;
        double root;
        precision = pow(0.1, decimal_points);
        System.out.println("start");
        a = System.nanoTime();
        root = (findRoot(x, n));
        b = System.nanoTime();
        System.out.println(a - b);
        System.out.println(root);
        System.out.println((long)(root*1E7));
    }

    public static double findRoot(double x, int n) {
        return root(x, n, 1, 1);
    }

    public static double root(double x, int n, double guess, double scale) {
        try {
            double val = pow(guess, n);
//            System.out.println(val + " - " + guess);
            double cmp = val - x;
            if (cmp < 0) {
                cmp = -cmp;
            }
            if (cmp < precision) {
                return guess;
            }
            if (val < x) {
                return root(x, n, (guess + scale), scale);
            } else if (val > x) {
                scale *= 0.67;
                return root(x, n, guess - scale, scale);
            }
            return -1;
        } catch (StackOverflowError ex) {
            return guess;
        }
    }

    public static double pow(double x, int n) {
        double res = x;
        for (int i = 1; i < n; i++) {
            res *= x;
        }
        return res;
    }
}

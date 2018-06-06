
/**
 *
 * @author JA
 */
public class NewtonSecant {
    
    private static double decimal_points = 7;
    private static double precision;
    
    public static void main(String[] args) {
        precision = pow(0.1, decimal_points);
        System.out.println(Math.pow(612,0.5));
        System.out.println(newtonSecant(612,2));
    }
    
    public static double newtonSecant(double x, double n){
        return newtonSecant(x,n,0,1);
    }
    
    public static double newtonSecant(double x, double n, double x0, double x1){
        double fx0 = f(x0,n,x);
        double fx1 = f(x1,n,x);
        double x2 = x1-fx1*(x1-x0)/(fx1-fx0);
        if(abs(x2-x1)<precision) return x2;
        else return newtonSecant(x,n,x1,x2);
    }
    
    public static double f(double x, double n, double x_){
        return pow(x,n)-x_;
    }
    
    public static double pow(double x, double n){
        if(n==0) return 1;
        for(int i=1;i<n;i++){
            x *= x;
        }
        return x;
    }
    
    public static double abs(double x){
        if(x<0) return -x;
        else return x;
    }
}

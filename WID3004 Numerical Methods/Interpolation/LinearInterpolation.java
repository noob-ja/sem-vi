
/**
 *
 * @author JA
 */
public class LinearInterpolation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double X[] = {1,2,3,4};
        double Y[] = {1,4,9,16};
        double x = 10.0;
        System.out.println(polynomial(x,X,Y));
    }
    
    public static double polynomial(double x, double X[], double Y[]){
        double total = 0;
        for(int i=0;i<X.length;i++){
            total += Y[i]*subpoly(x,i,X);
        }return total;
    }
    
    public static double subpoly(double x,int pointer, double X[]){
        double result = 1;
        double xi = X[pointer];
        for(int j=0;j<X.length;j++){
            if(j==pointer) continue;
            else{
                result *= (x-X[j])/(xi-X[j]);
            }
        }
        return result;
    }
    
}

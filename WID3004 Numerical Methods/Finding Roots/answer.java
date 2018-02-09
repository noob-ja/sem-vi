public class run {
    
    public static void main(String[] args) {
        double x = 25;
        int n = 2;
        long a, b;
        System.out.println(pow(x,n));
        
        a = System.nanoTime();
        System.out.println(root(x,n,1,1));
        b = System.nanoTime();
        System.out.println(a-b);
        
        a = System.nanoTime();
        System.out.println(Math.sqrt(x));
        b = System.nanoTime();
        System.out.println(a-b);
    }
    
    public static double root(double x, int n, double guess, double scale){
        double val = pow(guess,n);
        if(val<x){
            return root(x,n,(guess+scale),scale);
        }else if(val>x){
            scale/=10;
            return root(x,n,guess-scale,scale);
        }else{
            return guess;
        }
    }
    
    public static double pow(double x, int n){
        double res = x;
        for(int i=1;i<n;i++){ res*=res; }
        return res;
    }
}

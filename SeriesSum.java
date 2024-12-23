import java.util.Scanner;
 
public class SeriesSum {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter the value of X: ");
        double x = scanner.nextDouble();
        
        System.out.print("Enter the number of terms (n): ");
        int n = scanner.nextInt();
        
        double sum = 0;
        int sign = 1; // To alternate between + and -
        int fact = 1; // To calculate factorial
        int power = 1; // To keep track of the power of x
        
        for (int i = 1; i <= n; i++) {
            sum += sign * (Math.pow(x, power) / fact);
            sign *= -1;
            power += 2; // Increase power by 2 for the next term
            fact *= (power - 1) * power; // Update factorial for the next term
        }
        
        System.out.printf("The sum of the series is: %.5f\n", sum);
    }
}

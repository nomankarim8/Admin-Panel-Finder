#include <stdio.h>
#include <math.h>

// Define the function f(x) whose root is to be found
double f(double x) {
    // Example function: f(x) = x^3 - x - 2
    return x * x * x - x - 1;
}

// Bisection Method implementation
void bisection(double a, double b, double tol) {
    if (f(a) * f(b) >= 0) {
        printf("Invalid interval. The function must have opposite signs at a and b.\n");
        return;
    }

    
    
    double c;  // Midpoint
    int iteration = 0;

    // Printing the table header
    printf("\nIter\t    a\t        b\t        c\t      f(c)\n");
    printf("-------------------------------------------------------------\n");

    while ((b - a) >= tol) {
        iteration++;
        c = (a + b) / 2;  // Midpoint

        // Print the current iteration values
        printf("%3d\t%9.6lf\t%9.6lf\t%9.6lf\t%9.6lf\n", iteration, a, b, c, f(c));

        // If f(c) is zero or sufficiently close, root is found
        if (fabs(f(c)) <= tol) {
            printf("\nRoot found at: %lf after %d iterations\n", c, iteration);
            return;
        }

        // Narrow down the interval based on the sign of f(c)
        if (f(c) * f(a) < 0) {
            b = c;
        } else {
            a = c;
        }
    }

    // Output the approximation after iterations
    printf("\nThe root is approximately: %lf after %d iterations\n", c, iteration);
}

int main() {
    double a, b, tolerance;

    // Input interval and tolerance
    printf("Enter the interval [a, b]:\n");
    scanf("%lf %lf", &a, &b);

    printf("Enter the tolerance: ");
    scanf("%lf", &tolerance);

    // Call Bisection Method
    bisection(a, b, tolerance);

    return 0;
}
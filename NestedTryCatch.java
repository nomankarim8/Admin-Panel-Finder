public class NestedTryCatch {
    public static void main(String[] args) {
        int j = 0, k = 55;
        int[] java = null;

        try {
            System.out.println(java.length); // May throw NullPointerException

            try {
                k = k / j; // May throw ArithmeticException
            } catch (ArithmeticException e) {
                System.out.println("Arithmetic Exception caught");
            }

        } catch (NullPointerException e) {
            System.out.println("String Exception caught");
        } finally {
            System.out.println("Hello");
        }
    }
}

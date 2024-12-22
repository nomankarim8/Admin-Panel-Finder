class Book {
    private String name;
    private String author;
    private int publicationYear;

    // Constructor
    public Book(String name, String author, int publicationYear) {
        this.name = name;
        this.author = author;
        setPublicationYear(publicationYear); // Using setter to validate
    }

    // Getter and Setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPublicationYear() {
        return publicationYear;
    }

    public void setPublicationYear(int publicationYear) {
        if (publicationYear > 0) {
            this.publicationYear = publicationYear;
        } else {
            System.out.println("Invalid publication year. Setting default value: 2000.");
            this.publicationYear = 2000; // Default value
        }
    }

    public void showBookInfo() {
        System.out.println("Book Name: " + name);
        System.out.println("Author: " + author);
        System.out.println("Publication Year: " + publicationYear);
    }
}

// Main class
public class BookTest {
    public static void main(String[] args) {
        // Valid book
        Book book1 = new Book("Programming with Java", "Balaguruswamy", 2000);
        book1.showBookInfo();

        // Invalid year
        Book book2 = new Book("Invalid Book", "Unknown", -2024);
        book2.showBookInfo();
    }
}

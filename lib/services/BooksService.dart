import 'package:first_flutter_app/models/Book.dart';

class BooksService {
  final _books = [
    //Book("Learning Web Design", "SN1238", "J.N Robbin", 2012, true),
    //

    Book("Data Structures and Algorithms in Java", "SN1240", "T. Goodrich",
        1997, false),
    Book("Clean Code", "SN1241", "Robert Cecil", 2008, false),
    Book("Software Architecture in Practice", "SN1242", "P. Clements", 1997,
        false),
    Book("Extragalactic Astronomy and Cosmology", "SN1235", "P. Schneider",
        2006, false),
    Book("Thermodynamics: An Engineering Approach", "SN12354", "M. A. Boles ",
        1989, false),

    // Book("Harry Potter", "SN123", "J. K. Rowling", 1997, false),
    // Book("Sea of Tranquility: A Novel", "SN1239", "E.J Mandel", 2022, true),
    // Book("To Paradise", "SN1239", "H. Yanagihara", 2022, true),
    // Book("C# algorithms", "SN12345", "B. Gates", 1995, false),
    // Book("Software architect", "SN1236", "J. Kani", 2013, false),
    // Book("OOP with Java", "SN1237", "X. James", 2007, false),
  ];

  List<Book> getBooks() {
    return _books;
  }

  Book getBookByISBN(String isbn) {
    return _books.firstWhere((e) => e.isbn_number == isbn);
  }

  void addBook(Book book) {
    _books.add(book);
    print("Book added");
  }
}

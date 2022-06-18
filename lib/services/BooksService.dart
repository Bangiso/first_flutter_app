import 'package:first_flutter_app/models/Book.dart';

class BooksService {
  var books = [

    Book("Learning Web Design", "SN1238", "J.N Robbin", 2012),
    //

    Book("Data Structures and Algorithms in Java", "SN1240",
        "T. Goodrich", 1997),
    Book("Clean Code", "SN1241", "Robert Cecil", 2008),
    Book("Software Architecture in Practice", "SN1242", "P. Clements",
        1997),
    Book("Extragalactic Astronomy and Cosmology", "SN1235", "P. Schneider",  2006),
    Book("Thermodynamics: An Engineering Approach", "SN12354", "M. A. Boles ", 1989),
    Book("Harry Potter", "SN123", "J. K. Rowling", 1997),
    Book(
        "Sea of Tranquility: A Novel", "SN1239", "E.J Mandel", 2022),
    Book("To Paradise", "SN1239", "H. Yanagihara", 2022),
    Book("C# algorithms", "SN12345", "B. Gates", 1995),
    Book("Software architect", "SN1236", "J. Kani", 2013),
    Book("OOP with Java", "SN1237", "X. James", 2007),
  ];

  List<Book> getBooks() {
    return books;
  }

  Book getBookByISBN(String isbn) {
    return books.firstWhere((e) => e.isbn_number == isbn);
  }
}

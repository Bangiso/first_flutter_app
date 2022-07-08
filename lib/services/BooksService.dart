import 'package:first_flutter_app/models/Book.dart';

class BooksService {
  final _books = [
    Book("Data Structures and Algorithms in Java", "SN1240", "T. Goodrich",
        1997, false),
    Book("Clean Code", "SN1241", "Robert Cecil", 2008, false),
    Book("Software Architecture in Practice", "SN1242", "P. Clements", 1997,
        false),
    Book("Extragalactic Astronomy and Cosmology", "SN1235", "P. Schneider",
        2006, false),
    Book("Thermodynamics: An Engineering Approach", "SN12354", "M. A. Boles ",
        1989, false)
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

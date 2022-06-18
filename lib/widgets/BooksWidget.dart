import 'package:flutter/material.dart';
import 'package:first_flutter_app/models/Book.dart';
import 'BooksDetailsWidget.dart';

class BooksWidget extends StatelessWidget {
  BooksWidget(Key? key, this.book) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BooksDetailsWidget(key, book)),
          );
        },
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(book.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text("By ${book.author}")
                      ])),
            )
          ],
        )));
  }
}

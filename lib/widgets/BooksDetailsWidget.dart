import 'package:flutter/material.dart';
import 'package:first_flutter_app/models/Book.dart';

class BooksDetailsWidget extends StatelessWidget {
   const BooksDetailsWidget(this.book, {Key? key}) : super(key: key);
   final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(book.title)),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            createCard("Author : ", book.author),
            createCard("ISBN : ", book.isbn_number),
            createCard("Year : ", book.year.toString())
          ],
        ),
    );
  }

  Card createCard(String keyHeader, String text) {
    return Card(
        child:
        SizedBox(
            // width: 300,
            height: 100,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(keyHeader, style: const TextStyle(fontWeight:
                  FontWeight.bold,
                      fontSize: 30)),
                  Text(text, style: const TextStyle(
                      fontSize: 30))
                ]
            )));
  }
}

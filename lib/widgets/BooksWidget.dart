import 'package:flutter/material.dart';
import 'package:first_flutter_app/models/Book.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'BooksDetailsWidget.dart';

class BooksWidget extends StatelessWidget {
  const BooksWidget(this.book, this.favs, {Key? key}) : super(key: key);

  final Book book;
  final List<Book> favs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BooksDetailsWidget(book)),
          );
        },
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(book.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text("By ${book.author}"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                //icon: Icon(Icons.favorite, size: 18, color: Color(book.isFavorite?0xFFFFFFFF: 0xFF000000)),
                                icon: Icon(book.isFavorite?Icons.favorite:Icons.favorite_border, size: 18, color: book.isFavorite?Colors.red:Colors.black,),
                                onPressed: () {
                                  Book bookNew = book;

                                  if(bookNew.isFavorite==false){
                                    bookNew.isFavorite = true;
                                    favs.add(bookNew);
                                    Fluttertoast.showToast(
                                        msg: 'Book added to favourites',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 20.0);
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: 'Book is already your favourite',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 20.0);
                                  }
                                },
                              )
                            ])
                      ])),
            )
          ],
        )));
  }
}

import 'package:first_flutter_app/services/BooksService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/Book.dart';

class AddBookWidget  extends StatelessWidget {
  AddBookWidget( this.booksService, {Key? key}) : super(key: key);
  BooksService booksService;

  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final isbnController = TextEditingController();
  final yearController = TextEditingController();

  void clearText(){
    titleController.clear();
    isbnController.clear();
    authorController.clear();
    yearController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add book'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: authorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Author',
                      hintText: 'Enter Author Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      hintText: 'Enter Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: isbnController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ISBN',
                      hintText: 'Enter ISBN Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Year',
                      hintText: 'Enter Year',
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                              booksService.addBook(Book(
                                  titleController.text.toString(),
                                  isbnController.text.toString(),
                                  authorController.text.toString(),
                                  int.parse(yearController.text),
                                  false)
                              );
                              Fluttertoast.showToast(
                                  msg: "Book with ISBN ${isbnController.text.toString()} added",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 20.0);
                              clearText();
                            },
                          child:  const Text('Add')
                      )
                    ])
              ],
            )));
  }
}

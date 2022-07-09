import 'package:flutter/material.dart';
import '../models/Book.dart';
import 'BooksDetailsWidget.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget(this.books, {Key? key}) : super(key: key);
  List<Book> books;

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<SearchWidget> {
  String keyWord = "";
  final titleController = TextEditingController();

  ListView getAll(BuildContext context, String keyWord) {
    if (widget.books.isNotEmpty && keyWord.isNotEmpty) {
      return ListView(
          padding: const EdgeInsets.all(8),
          children: widget.books
              .where((b) =>
                  b.title.toLowerCase().contains(keyWord.toLowerCase()) ||
                  b.author.toLowerCase().contains(keyWord.toLowerCase()))
              .map((e) => Card(
                      child: ListTile(
                    title: Text(e.title),
                    subtitle: Text("By ${e.author}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BooksDetailsWidget(e)),
                      );
                    },
                  )))
              .toList());
    } else {
      return ListView(children: const [
        Center(
            child: Center(
          child: Text("No books found!",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30)),
        ))
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        keyWord = titleController.text.toString();
                        titleController.clear();
                      });
                    },
                  ),
                  hintText: ' Search...',
                  border: InputBorder.none),
            ),
          ),
        )),
        body:  getAll(context, keyWord));
  }
}

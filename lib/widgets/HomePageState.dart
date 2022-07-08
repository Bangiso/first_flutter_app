import 'package:first_flutter_app/services/BooksService.dart';
import 'package:first_flutter_app/widgets/BooksWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_flutter_app/widgets/MyHomePage.dart';
import '../models/Book.dart';
import 'AddBookWidget.dart';
import 'ProfileWidget.dart';

class MyHomePageState extends State<MyHomePage> {
  MyHomePageState({Key? key});

  static const String title = 'My Books';
  int _selectedIndex = 0;
  late BooksService booksService;
  late List<Book> favs;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getFavs(List<Book> favs) {
    if (favs.isEmpty) {
      return const Center(
          child: Text("No books yet, your favourite books will appear here!", style: TextStyle(fontWeight:
          FontWeight.normal,
              fontSize: 25)));
    } else {
      return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          children: favs
              .map((e) => Container(
                    padding: const EdgeInsets.all(5),
                    child: BooksWidget(book: e, favs: favs, key: UniqueKey()),
                  ))
              .toList());
    }
  }

  @override
  void initState() {
    super.initState();
    booksService = BooksService();
    favs = booksService
        .getBooks()
        .where((book) => book.isFavorite == true)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
                height: 90.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Text('Manu options'),
                )),
            ListTile(
              leading: const Icon(
                Icons.account_box_rounded,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "This functionality is not implemented yet.",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 20.0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
              ),
              title: const Text('About'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  // applicationIcon: const FlutterLogo(),
                  applicationName: 'About Us',
                  applicationVersion: '\u{a9} June 2022',
                  // applicationLegalese: '\u{a9} 2022 The Library Authors',
                  children: [
                    const Text("We provide personalised books for users.")
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              children: booksService
                  .getBooks()
                  .map((book) => Container(
                      padding: const EdgeInsets.all(5),
                      child: BooksWidget(
                        book: book,
                        favs: favs,
                        key: UniqueKey(),
                      )))
                  .toList()),
          _getFavs(favs),
          AddBookWidget(booksService)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

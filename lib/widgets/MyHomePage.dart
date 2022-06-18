import 'package:first_flutter_app/services/BooksService.dart';
import 'package:first_flutter_app/widgets/BooksWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ProfileWidget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final BooksService booksService = BooksService();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title),
          centerTitle: true
        ),
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
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 20.0
                  );
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
                    children: [const Text("We provide personalised books for users.")],
                  );
                },
              ),
            ],
          ),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            children: booksService
                .getBooks()
                .map((book) => Container(
                    padding: const EdgeInsets.all(5),
                    child: BooksWidget(key, book)))
                .toList()
        )
    );
  }
}

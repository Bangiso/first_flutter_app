import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
        body: Column(
            children:  [
              createCard("Name:  ", "Aphiwe"),
              createCard("Surname:  ", "Bangiso"),
              createCard("Email:  ", "aphiwe@gmail.com"),
              createCard("Gender:  ","Male"),
              createCard("Date of Birth:  ","17 June 2022")
            ],
          ),
    );
  }
  Card createCard(String keyHeader, String text) {
    return Card(
        child:
        SizedBox(
            width: 300,
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(keyHeader, style: const TextStyle(fontWeight:
                  FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20)),
                  Text(text, style: const TextStyle(
                      fontSize: 20))
                ]
            )));
  }
}

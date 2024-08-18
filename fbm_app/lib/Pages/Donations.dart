import 'package:fbm_app/Button/aligned_button.dart';
// ignore: unused_import
import 'package:fbm_app/Button/button.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class Donations extends StatelessWidget {
  const Donations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> Donations = [
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
      {'title': 'FOOD BANK NAME:', 'body': 'No of Meals Donated:'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text_Theme.text_size("MY DONATIONS", 20),
        leading: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 550,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final donation = Donations[index];
                      return Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: ListTile(
                            title: Text_Theme.text_size(donation['title']!, 20),
                            subtitle:
                                Text_Theme.text_size(donation['body']!, 15),
                          ));
                    })),
            SizedBox(
              height: 100,
            ),
            AlignedButton(
              text: "",
              routeName: "/outlets",
              icon: Icon(Icons.add),
              align: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}

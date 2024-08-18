import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class CookedFood extends StatelessWidget {
  const CookedFood({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> Volunteers = [
      {
        'Sno': '1',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '2',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '3',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '4',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '5',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '6',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '7',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '8',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '9',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
      {
        'Sno': '10',
        'title': 'Item:',
        'body': 'Quantity:',
        'expiry': 'Expiry Date:'
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Cooked Food",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Color.fromARGB(235, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 800,
              child: ListView.builder(
                itemCount: Volunteers.length,
                itemBuilder: (BuildContext context, int index) {
                  final volunteer = Volunteers[index];
                  final serial = '${volunteer['Sno']}';
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 16.0),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_Theme.text_size(serial, 20),
                          Text_Theme.text_size(volunteer['title']!, 20),
                          Text_Theme.text_size(volunteer['body']!, 20),
                          Text_Theme.text_size(volunteer['expiry']!, 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

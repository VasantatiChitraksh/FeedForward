import 'package:fbm_app/Button/button.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class Volunteers extends StatelessWidget {
  const Volunteers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> volunteer = ['V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7'];
    final List<Map<String, String>> Volunteers = [
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
      {'title': 'UserName:', 'body': 'No of Hours Volunteered:'},
    ];
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          backgroundColor: AppTheme.secondaryColor,
          title: Text(
            "VOLUNTEERS",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 246, 244, 244)),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: volunteer.length,
              itemBuilder: (BuildContext context, int index) {
                final serial = volunteer[index];
                final volun = Volunteers[index];
                return Card(
                 margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: ListTile(
                          title: Column(children: [
                            Text_Theme.text_size(serial, 22),
                            Text_Theme.text_size(volun['title']!, 22),
                          ]),
                          subtitle:
                              Text_Theme.text_size(volun['body']!, 22),
                        ) 
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    butt(icon: Icon(Icons.add), routeName: "/vform",text: "",),
              ),
            ),
          ],
        ),
      );
  }
}

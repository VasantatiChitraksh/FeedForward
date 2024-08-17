import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class volunteers_info extends StatelessWidget {
  const volunteers_info({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> Volunteers = [
      {'Sno': '1', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '2', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '3', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '4', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '5', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '6', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '7', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '8', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '9', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
      {'Sno': '10', 'title': 'User Name:', 'body': 'No of Hours Volunteered:'},
    ];

    return Scaffold(
        backgroundColor: AppTheme.bgcolor(),
        appBar: AppBar(
          backgroundColor: AppTheme.titleColor(),
          title: const Text(
            "Volunteer Info",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 800,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    final volunteer = Volunteers[index];
                    final serial = 'V${volunteer['Sno']}';
                    return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: ListTile(
                          title: Column(children: [
                            Text_Theme.text_size(serial, 20),
                            Text_Theme.text_size(volunteer['title']!, 20),
                          ]),
                          subtitle:
                              Text_Theme.text_size(volunteer['body']!, 15),
                        ));
                  },
                ),
              )
            ],
          ),
        ));
  }
}

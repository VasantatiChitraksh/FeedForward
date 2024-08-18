import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class volunteers_info extends StatelessWidget {
  const volunteers_info({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> Volunteers = [
      {
        'Sno': '1',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '2',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '3',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '4',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '5',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '6',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '7',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '8',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '9',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
      {
        'Sno': '10',
        'title': 'Food Bank Name:',
        'body': 'No of Hours Volunteered:'
      },
    ];

    return Scaffold(
        backgroundColor: AppTheme.bgcolor(),
        appBar: AppBar(
          backgroundColor: AppTheme.titleColor(),
          title: const Text(
            "VOLUNTEER INFO",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
                            vertical: 15.0, horizontal: 16.0),
                        child: ListTile(
                          title: Column(children: [
                            Text_Theme.text_size(serial, 20),
                            Text_Theme.text_size(volunteer['title']!, 20),
                          ]),
                          subtitle:
                              Text_Theme.text_size(volunteer['body']!, 20),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
        );
  }
}

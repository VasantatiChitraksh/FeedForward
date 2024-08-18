import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final TextEditingController _userNameController =
      TextEditingController(text: 'User Name');
  final TextEditingController _hoursController =
      TextEditingController(text: 'Volunter Hours');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: AppTheme.bgcolor(),
        title: Text(
          'Volunteer Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 200),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: 'Enter the username',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 200),
            TextField(
              controller: _hoursController,
              decoration: InputDecoration(
                labelText: 'Enter the number of hours worked',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

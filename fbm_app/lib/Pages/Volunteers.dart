import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';

class Volunteers extends StatelessWidget {
  const Volunteers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> volunteer = ['V1', 'V2', 'V3', 'v4', 'V5', 'V6', 'V7'];
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: AppTheme.secondaryColor,
        title: Text(
          "Volunteers",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: ListView.builder(
        itemCount: volunteer.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              volunteer[index], // Start numbering from 1
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: TextEditingController(text: 'Volunteer Name'),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: TextEditingController(text: 'Contact Info'),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

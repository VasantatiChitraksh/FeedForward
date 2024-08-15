import 'package:flutter/material.dart';
import 'package:fbm_app/Styles/BgColor.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> restaurants_ = [
      'R1',
      'R2',
      'R3',
      'R4',
      'R5',
      'R6',
      'R7'
    ];
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "RESTAURANTS",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: restaurants_.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              restaurants_[index], // Start numbering from 1
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: TextEditingController(text: 'Restarunt Name'),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: TextEditingController(text: 'Adress'),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: TextEditingController(text: 'Contact_Info'),
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

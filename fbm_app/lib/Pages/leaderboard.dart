import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';

class leaderboard extends StatelessWidget {
  const leaderboard({super.key});

  Future<int> calculatePoints(QueryDocumentSnapshot doc) {
    return doc['rice (kg)'] * 1 +
        doc['bread'] * 2 +
        doc['pulses'] * 3 +
        doc['simple_meals'] * 5 +
        doc['complex_meals'] * 7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Leaderboard",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
            height: 70,
          ),
          TextField(
            controller: TextEditingController(text: 'Number of meals donated'),
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: TextEditingController(text: 'Number of active users'),
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.brown,
            height: 30,
            width: 120,
            child: Center(
              child: Text(
                "Volunteer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.brown,
            height: 500,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  title: Text(''),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: const Color.fromARGB(255, 35, 137, 38),
            height: 30,
            width: 120,
            child: Center(
              child: Text(
                "Donations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 35, 137, 38),
            height: 500,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  title: Text(''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

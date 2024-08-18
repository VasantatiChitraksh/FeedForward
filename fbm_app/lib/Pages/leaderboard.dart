import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/classes/leaderboard_class.dart';
import 'package:flutter/material.dart';

class leaderboard extends StatelessWidget {
  const leaderboard({super.key});

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
          const SizedBox(
            height: 70,
          ),
          TextField(
            controller: TextEditingController(text: 'Number of meals donated'),
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: TextEditingController(text: 'Number of active users'),
            readOnly: true,
            decoration: const InputDecoration(
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
            child: const Center(
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
              itemCount: LeaderboardClass.userPointsSortedVolunteers.length >= 10
                  ? LeaderboardClass.userPointsVolunteers.length
                  : 10,
              itemBuilder: (BuildContext context, int index) {
                var user = LeaderboardClass.userPointsVolunteers.entries.toList()[0].key;
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  title: Text(user),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(

            color: const Color.fromARGB(255, 35, 137, 38),
            height: 30,
            width: 120,
            child: const Center(
              child: Text(
                "Donations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

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
              itemCount: LeaderboardClass.userPointsSortedDonations.length >= 10
                  ? LeaderboardClass.userPointsDonations.length
                  : 10,
              itemBuilder: (BuildContext context, int index) {
                var user = LeaderboardClass.userPointsDonations.entries.toList()[0].key;
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  title: Text(user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

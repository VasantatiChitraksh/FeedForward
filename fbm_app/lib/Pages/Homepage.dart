import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Bank",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        butt(
            text: "Profile",
            routeName: "/profile",
            icon: Icon(Icons.account_circle)),
        butt(text: "Map", routeName: "/map", icon: Icon(Icons.location_on)),
        butt(
            text: "LeaderBoard",
            routeName: "/leaderboard",
            icon: Icon(Icons.emoji_events)),
        butt(
            text: "WasteManagement",
            routeName: "/waste",
            icon: Icon(Icons.recycling_rounded)),
        butt(
            text: "Restaurants",
            routeName: "/rprofile",
            icon: Icon(Icons.account_circle))
      ]),
    );
  }
}

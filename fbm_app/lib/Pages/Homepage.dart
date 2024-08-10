import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const List<String> route = ['/profile', '/rprofile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "FEED FORWARD",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        butt(
            text: "Profile",
            routeName: route[0],
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
      ]),
    );
  }
}

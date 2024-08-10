import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const List<String> route = ['/profile', '/rprofile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            )),
        backgroundColor: AppTheme.titleColor(),
        title: Text_Theme.text("FEED FORWARD"),
        centerTitle: true,
      ),
      body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text_Theme.text_size(
                  "NOTIFICATIONS:",
                  20,
                ),
                Spacer(flex: 8),
                butt(
                    text: "PROFILE  ",
                    routeName: route[0],
                    icon: Icon(Icons.account_circle)),
                SizedBox(height: 5),
                butt(
                    text: "    MAP    ",
                    routeName: "/map",
                    icon: Icon(Icons.location_on)),
                Spacer()
              ],
            ),
            SizedBox(width: 15),
            Column(children: [
              Spacer(flex: 8),
              butt(
                  text: "LEADERBOARD",
                  routeName: "/leaderboard",
                  icon: Icon(Icons.emoji_events)),
              SizedBox(height: 5),
              butt(
                  text: "WASTE\nMANAGEMENT",
                  routeName: "/waste",
                  icon: Icon(Icons.recycling_rounded)),
              Spacer(),
            ])
          ]),
    );
  }
}

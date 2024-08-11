import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const List<String> route = ['/profile', '/rprofile'];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {'title': 'Notification 1', 'body': 'This is the body of notification 1'},
      {'title': 'Notification 2', 'body': 'This is the body of notification 2'},
      {'title': 'Notification 3', 'body': 'This is the body of notification 3'},
      {'title': 'Notification 4', 'body': 'This is the body of notification 1'},
      {'title': 'Notification 5', 'body': 'This is the body of notification 2'},
      {'title': 'Notification 6', 'body': 'This is the body of notification 3'},
    ];
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
        // backgroundColor: AppTheme.titleColor(),
        title: Text_Theme.text_size("NOTIFICATIONS", 20),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final noti = notifications[index];
                    return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text_Theme.text_size(noti['title']!, 20),
                          subtitle: Text_Theme.text_size(noti['body']!, 15),
                        ));
                  }),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40),
                butt(
                    text: " PROFILE  ",
                    routeName: route[0],
                    icon: Icon(Icons.account_circle)),
                SizedBox(width: 20),
                butt(
                    text: "    MAP      ",
                    routeName: "/map",
                    icon: Icon(Icons.location_on)),
              ],
            ),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              butt(
                  text: "LEADERBOARD",
                  routeName: "/leaderboard",
                  icon: Icon(Icons.emoji_events)),
              SizedBox(width: 10),
              butt(
                  text: "WASTE\nMANAGEMENT",
                  routeName: "/waste",
                  icon: Icon(Icons.recycling_rounded)),
            ]),
            SizedBox(
              height: 50,
            ),
          ]),
    );
  }
}

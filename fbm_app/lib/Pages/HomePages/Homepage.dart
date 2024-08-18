import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:fbm_app/classes/leaderboard_class.dart';
import 'package:fbm_app/classes/notification_class.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Homepage extends StatefulWidget {
  final  Map <String,dynamic > userDetails;
   const Homepage({super.key, required this.userDetails});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

   late int r;
  static const List<String> route = ['/profile', '/rprofile'];

  @override
   void initState() {
    super.initState();
    r = widget.userDetails['role'];
  }
  

  @override
  Widget build(BuildContext context) {
    NotificationClass(
        'Leaderboard', '${LeaderboardClass.winnerDonation} is no.1 donor');
    NotificationClass(
        'Leaderboard', '${LeaderboardClass.winnerVolunteer} is no.1 volunteer');

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
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Container(
                      height: 425,
                      child: ListView.builder(
                          itemCount: NotificationClass.notifications.length,
                          itemBuilder: (context, index) {
                            final noti = NotificationClass.notifications[index];
                            return Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 16.0),
                                child: ListTile(
                                  title: Text_Theme.text_size(noti.title, 20),
                                  subtitle:
                                      Text_Theme.text_size(noti.subtitle, 15),
                                ));
                          })),
                ),
                Container(
                  height: 50,
                  child: GestureDetector(onDoubleTap: () {
                    Navigator.pushNamed(context, '/emergency');
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
                        routeName: route[r],
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
        ));
  }
}

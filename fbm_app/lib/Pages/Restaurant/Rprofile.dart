import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class RestaurantProfile extends StatelessWidget {
  const RestaurantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            butt(
              text: "Food Banks",
              routeName: "/listfb",
              icon: Icon(Icons.food_bank),
            )
          ],
        ));
  }
}

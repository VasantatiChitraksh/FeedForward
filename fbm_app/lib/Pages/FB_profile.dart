import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class FbProfile extends StatelessWidget {
  const FbProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 0, 0, 0))),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            butt(
                text: "My FB",
                routeName: "/fb_info",
                icon: Icon(Icons.food_bank)),
            butt(text: "Donations", routeName: "", icon: Icon(Icons.favorite)),
            butt(
                text: "Volunteer_exp",
                routeName: "",
                icon: Icon(Icons.account_circle_outlined))
          ],
        ));
  }
}

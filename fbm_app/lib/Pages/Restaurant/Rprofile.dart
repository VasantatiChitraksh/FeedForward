import 'package:fbm_app/Button/button.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class RestaurantProfile extends StatefulWidget {
  final  Map <String,dynamic > RDetails;
  const RestaurantProfile({super.key, required this.RDetails});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              )),
          title: Text_Theme.text_size("PROFILE", 20),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text_Theme.text_colored("DETAILS", 25, Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text_Theme.text_field("NAME", 15),
              SizedBox(
                height: 15,
              ),
              Text_Theme.text_field("ADDRESS", 15),
              SizedBox(
                height: 15,
              ),
              Text_Theme.text_field("CONTACT", 15),
              SizedBox(
                height: 150,
              ),
              butt(
                text: "Food Banks",
                routeName: "/listfb",
                icon: Icon(Icons.food_bank),
              )
            ],
          ),
        ));
  }
}

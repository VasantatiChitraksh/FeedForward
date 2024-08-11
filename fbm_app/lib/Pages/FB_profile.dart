import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';
import 'package:flutter/widgets.dart';

class FbProfile extends StatelessWidget {
  const FbProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromARGB(235, 0, 0, 0)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: TextEditingController(
              text: 'User Name',
            ),
            readOnly: true, // Makes the field non-editable
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: TextEditingController(text: 'Contact Info'),
            readOnly: true, // Makes the field non-editable
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 300,
          ),
          Row(
            children: [
              SizedBox(
                width: 75,
              ),
              butt(
                text: "My FB",
                routeName: "/fb_info",
                icon: Icon(Icons.food_bank),
              ),
              SizedBox(
                width: 20,
              ),
              butt(
                text: "Donations",
                routeName: "/mydonations",
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          butt(
            text: "Volunteer_exp",
            routeName: "/v_info",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}

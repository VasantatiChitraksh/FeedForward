import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';
import 'package:flutter/widgets.dart';

class FbProfile extends StatefulWidget {
  final  Map <String,dynamic > proDetails;
  const FbProfile({super.key,required this.proDetails});

  @override
  State<FbProfile> createState() => _FbProfileState();
}

class _FbProfileState extends State<FbProfile> {
 
   late Map <String,dynamic> Profile;

  @override
   void initState() {
    super.initState();
    Profile= widget.proDetails;
  }



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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text_Theme.text_colored("DETAILS", 30, Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text_Theme.text_field('User Name: ${Profile['name']}', 18),
            SizedBox(
              height: 15,
            ),
            Text_Theme.text_field('Contact info: ${Profile['contactnum']}', 18),
            SizedBox(
              height:15 ,),
            Text_Theme.text_field('E-Mail: ${Profile['email']}', 18),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 250,
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
      ),
    );
  }
}

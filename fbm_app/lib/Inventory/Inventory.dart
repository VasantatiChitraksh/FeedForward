import 'package:fbm_app/Button/button.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Inventory",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Color.fromARGB(235, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
                butt(
                  text: "Cooked Food",
                  routeName: "/cooked_food",
                  icon: Icon(Icons.restaurant),
                ),
                SizedBox(
                  height: 16,
                ),
                butt(
                  text: "Packaged Food",
                  routeName: "/packaged_food",
                  icon: Icon(Icons.restaurant),
                ),
                SizedBox(
                  height: 16,
                ),
                  butt(
                  text: "Staple Food",
                  routeName: "/staple_food",
                  icon: Icon(Icons.restaurant),
                ),
        ],
      ),
    );
  }
}
import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class Donations extends StatelessWidget {
  const Donations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Donations',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          butt(
            text: "",
            routeName: "/outlets",
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

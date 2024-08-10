import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class FB_Connected extends StatelessWidget {
  const FB_Connected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Banks",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),
      ),
      body: Column(
        children: [
          butt(text: "", routeName: '/outlets', icon: Icon(Icons.add))
        ],
      ),
    );
  }
}

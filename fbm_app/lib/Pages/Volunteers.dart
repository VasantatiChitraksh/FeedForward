import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class Volunteers extends StatelessWidget {
  const Volunteers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Volunteers",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Column(
          children: [
            butt(
              text: "",
              routeName: '/vform',
              icon: Icon(Icons.add),
            )
          ],
        ));
  }
}

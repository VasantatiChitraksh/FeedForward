import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Outlets extends StatelessWidget {
  const Outlets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Outlets",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(children: [
        butt(
            text: "Donate",
            routeName: "/d_form",
            icon: Icon(Icons.playlist_add_circle_rounded))
      ]),
    );
  }
}

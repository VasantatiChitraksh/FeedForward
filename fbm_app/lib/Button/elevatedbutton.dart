import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
  const button2({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Color.fromARGB(255, 233, 6, 6),
          padding: EdgeInsets.all(40),
        ),
        child: const Icon(
          Icons.warning,
          color: Colors.white,
          size: 50,
        ));
  }
}

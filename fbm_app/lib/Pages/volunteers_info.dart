import 'package:flutter/material.dart';

class volunteers_info extends StatelessWidget {
  const volunteers_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Volunteer Info",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}

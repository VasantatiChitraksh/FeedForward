import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Bank',
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
        )),
        ),
      );
  }
}
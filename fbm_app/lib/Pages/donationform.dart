import 'package:flutter/material.dart';

class Donation_form extends StatelessWidget {
  const Donation_form({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation Form",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(235, 0, 0, 0))),
        centerTitle: true,
      ),
    );
  }
}

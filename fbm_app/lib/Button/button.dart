import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  final String text = "Hello";

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      floatingActionButton: 
      FloatingActionButton.extended(
        label: Text(text,
        style: TextStyle(fontWeight: FontWeight.w400,
        color: Colors.black)), 
        onPressed: () {
          Navigator.pushNamed(context, routeName)
          },) ,
    );
  }

}
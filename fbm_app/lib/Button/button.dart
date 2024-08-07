import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});
  final String text;
  final 
  Button(Stru=)
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      floatingActionButton: 
      FloatingActionButton.extended(
        label: Text(text,
        style: TextStyle(fontWeight: FontWeight.w400,
        color: Colors.black)), 
        onPressed: () {
          Navigator.pushNamed(context, routeName);
          },) ,
    );
  }

}
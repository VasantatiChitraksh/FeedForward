import 'package:flutter/material.dart';

class butt extends StatelessWidget {
  const butt(
      {super.key,
      required this.text,
      required this.routeName,
      required this.icon});
  final String text;
  final String routeName;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(text,
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      icon: icon,
    );
  }
}

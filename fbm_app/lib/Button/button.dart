import 'package:flutter/material.dart';
import 'package:fbm_app/Styles/TextStyle.dart';

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
      label: Text_Theme.text(text),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      icon: icon,
    );
  }
}

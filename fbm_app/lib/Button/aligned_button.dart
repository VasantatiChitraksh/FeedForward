import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';

class AlignedButton extends StatelessWidget {
  const AlignedButton(
      {super.key,
      required this.text,
      required this.routeName,
      required this.icon,
      required this.align});
  final String text;
  final String routeName;
  final Icon icon;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: FloatingActionButton.extended(
        label: Text_Theme.text_white(text),
        backgroundColor: AppTheme.secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        icon: icon,
      ),
    );
  }
}

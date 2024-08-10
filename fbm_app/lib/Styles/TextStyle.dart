import 'package:flutter/material.dart';

class Text_Theme {
  static Text text(String s) {
    return Text(s,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
  }

  static Align text_size(String s, double size) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(s,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: size)));
  }
}

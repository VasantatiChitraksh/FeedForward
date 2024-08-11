import 'package:flutter/material.dart';

class Text_Theme {
  static Text text(String s) {
    return Text(s,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
  }
  static Text text_white(String s){
    return Text(s,
        style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 248, 248, 248)));
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

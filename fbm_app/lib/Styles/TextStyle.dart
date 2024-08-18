import 'package:flutter/material.dart';

class Text_Theme {
  static Text text(String s) {
    return Text(s,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
  }

  static Text text_white(String s) {
    return Text(
      s,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 248, 248, 248),
      ),
    );
  }

  static Align text_size(
    String s,
    double size,
  ) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(s,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: size)));
  }

  static Align text_colored(String s, double size, Color c) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(s,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: c, fontSize: size)));
  }

  static TextField text_field(String s, double size) {
    return TextField(
      controller: TextEditingController(
        text: s,
      ),
      readOnly: true, // Makes the field non-editable
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      style: TextStyle(
        fontSize: size,
        color: Colors.black,
      ),
    );
  }
}

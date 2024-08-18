import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(1, 5, 20, 0.635);
  static const Color secondaryColor = Color.fromARGB(255, 244, 5, 5);

  static Color bgcolor() {
    return primaryColor;
  }

  static Color titleColor() {
    return secondaryColor;
  }
}

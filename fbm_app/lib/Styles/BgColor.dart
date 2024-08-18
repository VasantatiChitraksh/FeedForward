import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(10, 15, 35, 0.631);
  static const Color secondaryColor = Color.fromARGB(255, 255, 0, 0);

  static Color bgcolor() {
    return primaryColor;
  }

  static Color titleColor() {
    return secondaryColor;
  }
}

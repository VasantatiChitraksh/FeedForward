import 'package:flutter/material.dart';

class CommonMethods
{
  displaysnackBar(String messageText, BuildContext context)
  {
var snackBar = SnackBar(content: Text(messageText));
ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
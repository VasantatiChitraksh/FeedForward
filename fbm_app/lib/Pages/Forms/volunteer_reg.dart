import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 


class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final TextEditingController _userNameController =
      TextEditingController();
  final TextEditingController _hoursController =
      TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<void> _saveUserData(String username, int hours, String foodbank) async {
    try {
    
      await _firestore.collection('volunteers').add({
        'username': username,
        'hours': hours,
        'foodbank':foodbank,
      });
      print("Data saved successfully");
    } catch (e) {
      print("Error saving data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

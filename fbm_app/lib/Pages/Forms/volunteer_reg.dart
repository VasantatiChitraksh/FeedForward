import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveUserData(
      String userName, int hoursWorked, String foodbank) async {
    try {
      await _firestore.collection('volunteers').add({
        'userName': userName,
        'hoursWorked': hoursWorked,
        'foodbank': foodbank,
      });
      print("Data saved successfully");
    } catch (e) {
      print("Error saving data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgcolor(),
        appBar: AppBar(
          elevation: 10,
          backgroundColor: AppTheme.bgcolor(),
          title: const Text(
            'Volunteer Form',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color.fromARGB(255, 248, 248, 248),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter the username',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 200),
                TextField(
                  controller: _hoursController,
                  decoration: InputDecoration(
                    labelText: 'Enter the number of hours worked',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () async {
                    // Parse the hours worked input to an integer
                    int hoursWorked = int.tryParse(_hoursController.text) ?? 0;

                    // Call the function to save the data to Firestore
                    // await _saveUserData(_userNameController.text, hoursWorked);

                    // Show a Snackbar to confirm data submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data saved successfully')),
                    );

                    // Clear the input fields after submission
                    _userNameController.clear();
                    _hoursController.clear();
                  },
                  child: Text('Submit'),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class Food_Bank_Management extends StatelessWidget {
  const Food_Bank_Management({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Bank Info',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            ),
          ),
          centerTitle : true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          butt(text: 'Inventory', 
               routeName: "/inventory", 
                icon: Icon(Icons.inventory),
          ),
          butt(text: 'Volunteers', 
               routeName: "volunteers", 
                icon: Icon(Icons.volunteer_activism),
          ),
        ],
      ),
    );
  }
}
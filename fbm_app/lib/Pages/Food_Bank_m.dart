import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';

class Food_Bank_Management extends StatelessWidget {
  const Food_Bank_Management({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 244, 5, 5),
        title: Text(
          'Food Bank Info',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: const Stack(
        children: const [
          Positioned(
            top: 100,
            left: 500,
            child: Text(
              "Food Bank Name:",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                  color: Colors.black87,
                  decoration: TextDecoration.underline),
            ),
          ),
          Positioned(
            top: 175,
            left: 500,
            child: Text(
              "Food Bank Adress:",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                  color: Colors.black87,
                  decoration: TextDecoration.underline),
            ),
          ),
          Positioned(
            top: 250,
            left: 500,
            child: Text(
              "Contact Info:",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                  color: Colors.black87,
                  decoration: TextDecoration.underline),
            ),
          ),
          Positioned(
            bottom: 175,
            left: 620,
            child: butt(
              text: 'Inventory',
              routeName: "/inventory",
              icon: Icon(Icons.inventory),
            ),
          ),
          Positioned(
            bottom: 175,
            left: 800,
            child: butt(
              text: 'Volunteers',
              routeName: "/volunteers",
              icon: Icon(Icons.volunteer_activism),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 700,
            child: butt(
              text: 'Restaurants',
              routeName: "/restaurants",
              icon: Icon(Icons.restaurant_menu_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

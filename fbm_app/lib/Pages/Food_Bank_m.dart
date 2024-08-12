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
        centerTitle: true,
      ),
      body:const Stack(
        children: const [
          Positioned(
            bottom: 100,
            left:500,
            child:butt(
            text: 'Inventory',
            routeName: "/inventory",
            icon: Icon(Icons.inventory),
          ),
          ),
         
          Positioned(
            bottom:100,
            left:600,
            child:butt(
            text: 'Volunteers',
            routeName: "/volunteers",
            icon: Icon(Icons.volunteer_activism),
          ),
          )
          Positioned(
            bottom: 50,
            left:550,
            child:butt(
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

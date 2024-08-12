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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Food Bank Name:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: TextEditingController(
              text: 'Food Bank Name',
            ),
            readOnly: true, // Makes the field non-editable
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Food Bank Adress:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: TextEditingController(text: 'Food Bank Adress'),
            readOnly: true, // Makes the field non-editable
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contact Info:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: TextEditingController(text: 'Contact info'),
            readOnly: true, // Makes the field non-editable
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 375,
              ),
              butt(
                text: "Inventory",
                routeName: "/inventory",
                icon: Icon(Icons.food_bank),
              ),
              SizedBox(
                width: 500,
              ),
              butt(
                text: "volunteers",
                routeName: "/volunteers",
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          butt(
            text: "Restarunts",
            routeName: "/restarunts",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}

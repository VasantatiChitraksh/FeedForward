import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';

class CookedFood extends StatelessWidget {
  const CookedFood({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> volunteer = ['1', '2', '3', '4', '5', '6', '7'];

    return Scaffold(
      backgroundColor: AppTheme.bgcolor(),
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Cooked Food",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Color.fromARGB(235, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: volunteer.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  volunteer[index], // Display volunteer number
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: TextEditingController(text: 'Item'),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: TextEditingController(text: 'Quantity'),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: TextEditingController(text: 'Expiry Date'),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
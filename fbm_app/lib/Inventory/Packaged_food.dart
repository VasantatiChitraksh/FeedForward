import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/material.dart';

class PackagedFood extends StatelessWidget {
  const PackagedFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.titleColor(),
        title: const Text(
          "Packaged Food",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Color.fromARGB(235, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              '${index + 1}',
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
    );
  }
}
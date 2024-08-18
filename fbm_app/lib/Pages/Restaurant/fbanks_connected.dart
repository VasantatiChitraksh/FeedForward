import 'package:fbm_app/Button/button.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Styles/BgColor.dart';

class FB_Connected extends StatelessWidget {
  const FB_Connected({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> f_b = ['NGO1', 'NG02', 'NGO3', 'NGO4', 'NGO5'];
    return Scaffold(
        backgroundColor: AppTheme.bgcolor(),
        appBar: AppBar(
          title: Text("Food Banks",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: f_b.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    f_b[index], // Start numbering from 1
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller:
                            TextEditingController(text: 'Foo_Bank_Name'),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: TextEditingController(text: 'Contact_Info'),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: TextEditingController(text: 'F_B_Adress'),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: butt(
                    icon: Icon(Icons.add), routeName: "/outlets", text: ""),
              ),
            ),
          ],
        ));
  }
}

import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';

class Outlets extends StatelessWidget {
  const Outlets({super.key});

  @override
  Widget build(BuildContext context) {
  final List<Map<String, String>> outlets = [
      {'title': 'Outlet 1', 'Address': 'Address : This is the body of notification 1'},
      {'title': 'Outlet 2', 'Address': 'This is the body of notification 2'},
      {'title': 'Outlet 3', 'Address': 'This is the body of notification 3'},
      {'title': 'Outlet 4', 'Address': 'This is the body of notification 1'},
      {'title': 'Outlet 5', 'Address': 'This is the body of notification 2'},
      {'title': 'Outlet 6', 'Address': 'This is the body of notification 3'},
    ];
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text(
          "OUTLETS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
      Container(
        height: 800,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index){
            final outlet = outlets[index];
            return Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      child: Column(
                        children: [
                          ListTile(
                          title: Text_Theme.text_size(outlet['title']!,25),
                          subtitle: Text_Theme.text_size(outlet['Address']!, 15)),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            butt(text: 'DONATE', routeName: '/d_form', icon: Icon(Icons.handshake_rounded),),
                          ],
                         ) 
      ])
                    );})
      )
      ]
      )
  );}
}

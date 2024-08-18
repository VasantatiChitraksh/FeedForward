import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:fbm_app/Button/button.dart';

class Donation_form extends StatefulWidget {
  const Donation_form({super.key});
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<Donation_form> {
  final List<String> _selected = [
    'Rice(kg/g)',
    'pulses(g)',
    'Complex_meals',
    'Simple_meals',
    'Bread'
  ];
  String Selected_item = "Rice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Donation Form",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 0, 0, 0))),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text_Theme.text_colored("Food Type-1", 24, Colors.black87),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: Selected_item,
                items: _selected.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  },
                ).toList(),
                onChanged: (String? newSelectedValue) {
                  setState(() {
                    this.Selected_item = newSelectedValue!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your quantity",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder())),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text_Theme.text_colored("Food Type-2", 24, Colors.black87),
              ),
              DropdownButton<String>(
                value: Selected_item,
                items: _selected.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  },
                ).toList(),
                onChanged: (String? newSelectedValue) {
                  setState(() {
                    Selected_item = newSelectedValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your quantity",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder())),
              ),
              const Row(children: [
               Row(children: [
                SizedBox(height: 40, width: 175),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: butt(
                      text: 'Donate',
                      icon: Icon(Icons.handshake_rounded),
                      routeName: ''),
                ),
              ])
              ]),
            ],
          ),
        ));
  }
}


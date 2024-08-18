import 'package:fbm_app/Styles/BgColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:fbm_app/Button/button.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  static List<ItemDonationWidget> widgets = [];

  void addWidgets() {
    widgets.add(const ItemDonationWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          title: const Text("Donation Form",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 0, 0, 0))),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //
              for (int i = 0; i < widgets.length; i++) widgets[i],
              //
              const Row(children: [
                SizedBox(height: 40, width: 135),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: butt(
                      text: 'Donate',
                      icon: Icon(Icons.handshake_rounded),
                      routeName: ''),
                ),
              ]),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  label: Text(""),
                  icon: Icon(Icons.add),
                  onPressed: addWidgets,
                  ),
              ),
            ],
          ),
        ));
  }
}

class ItemDonationWidget extends StatefulWidget {
  const ItemDonationWidget({super.key});

  @override
  State<ItemDonationWidget> createState() => _ItemDonationWidgetState();
}

class _ItemDonationWidgetState extends State<ItemDonationWidget> {
  final List<String> _selected = [
    'Rice',
    'Bread',
    'Pulses',
    'SimpleMeals',
    'ComplexMeals',
  ];
  String Selected_item = "Rice";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text_Theme.text_colored("Select Food Type", 24, Color.fromARGB(221, 0, 0, 0)),
          ),
          const SizedBox(height: 10),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "Enter your quantity in kg/meals",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder())),
          ),
        ],
      ),
    );
  }
}

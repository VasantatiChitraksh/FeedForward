import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbm_app/Styles/BgColor.dart';
import 'package:fbm_app/Styles/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/Button/button.dart';
import 'package:latlong2/latlong.dart';

class Outlets extends StatefulWidget {
  const Outlets({super.key});

  @override
  State<Outlets> createState() => _OutletsState();
}

class _OutletsState extends State<Outlets> {
  List<Map<String, LatLng>> outlets = [];

  @override
  void initState() {
    super.initState();
    loadFoodBankDetails();
    outlets.add({'Foodbank A': LatLng(37.7749, -122.4194)});
    outlets.add({'Foodbank B': LatLng(40.7128, -74.0060)});
    outlets.add({'Foodbank C': LatLng(34.0522, -118.2437)});
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 800,
                child: ListView.builder(
                    itemCount: outlets.length,
                    itemBuilder: (context, index) {
                      final outlet = outlets[index];
                      return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Column(children: [
                            ListTile(
                                title: Text_Theme.text_size(outlet.keys.first, 25),),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                butt(
                                  text: 'DONATE',
                                  routeName: '/d_form',
                                  icon: Icon(Icons.handshake_rounded),
                                ),
                              ],
                            ),
                          ]));
                    }))
          ]),
        ));
  }

  Future<void> loadFoodBankDetails() async {
    CollectionReference foodbankcollection =
        FirebaseFirestore.instance.collection('foodbank');

    QuerySnapshot queryfoodbank = await foodbankcollection.get();

    for (var doc in queryfoodbank.docs) {
      String name = doc['name'];
      var loc = doc['location'];
      LatLng latlng = LatLng(loc['latitude'], loc['longitude']);
      outlets.add({name: latlng});
    }
  }
}

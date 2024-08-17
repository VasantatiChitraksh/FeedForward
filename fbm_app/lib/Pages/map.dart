import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class MapOutlets extends StatefulWidget {
  const MapOutlets({super.key});

  @override
  State<MapOutlets> createState() => _MapOutletsState();
}

class _MapOutletsState extends State<MapOutlets> {
  List<Map<String, LatLng>> outlets = [];

  LatLng _center = LatLng(0, 0);
  MapController _mapController = MapController();
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _requestPermission();
    loadFoodBankDetails();
  }

//getting details from firebase
  Future<void> loadFoodBankDetails() async {
    CollectionReference foodbankcollection =
        FirebaseFirestore.instance.collection('foodbank');

    QuerySnapshot queryfoodbank = await foodbankcollection.get();

    for (var doc in queryfoodbank.docs) {
      String name = doc['name'];
      var loc = doc['location'];
      LatLng latlng = LatLng(loc['latitude'], loc['longitude']);
      outlets.add({name: latlng});
      markers.add(Marker(
        point: latlng,
        child: const Icon(Icons.location_pin, color: Colors.red),
      ));
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _getUserLocation();
    }
  }

  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      markers.add(Marker(
        point: _center,
        child: const Icon(Icons.location_pin, color: Colors.red),
      ));
      _mapController.move(_center, 12.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: MapWidget(
              center: _center, mapController: _mapController, markers: markers),
          elevation: 4,
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required LatLng center,
    required MapController mapController,
    required this.markers,
  })  : _center = center,
        _mapController = mapController;

  final LatLng _center;
  final MapController _mapController;
  final List<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        // center: _center,
        // zoom: 12.0,
      ),
      mapController: _mapController,
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: markers,
        )
      ],
    );
  }
}

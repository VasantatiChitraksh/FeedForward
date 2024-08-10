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
  LatLng _center = LatLng(0, 0);
  MapController _mapController = MapController();
  List<Marker> markers = [];

  void initState() {
    super.initState();
    _requestPermission();
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
        builder: (context) => Icon(Icons.location_pin, color: Colors.red),
      ));
      _mapController.move(_center, 12.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: _center,
          zoom: 12.0,
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
      ),
    );
  }
}

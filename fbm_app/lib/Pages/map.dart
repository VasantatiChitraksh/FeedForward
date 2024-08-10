// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapOutlets extends StatefulWidget {
//   const MapOutlets({super.key});

//   @override
//   State<MapOutlets> createState() => _MapOutletsState();
// }

// class _MapOutletsState extends State<MapOutlets> {
//   Location _location = Location();
//   LocationData? _currentLocation;
//   GoogleMapController? _mapController;

//   Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       bool _serviceEnabled;
//       PermissionStatus _permissionGranted;

//       _serviceEnabled = await _location.serviceEnabled();

//       if (!_serviceEnabled) {
//         _serviceEnabled = await _location.requestService();
//       }

//       _permissionGranted = await _location.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await _location.requestPermission();
//       }

//       _currentLocation = await _location.getLocation();

//       setState(() {
//         _markers.add(Marker(
//             markerId: MarkerId('user location'),
//             icon:
//                 BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//             position: LatLng(
//                 _currentLocation!.latitude!, _currentLocation!.longitude!)));

//         _mapController?.animateCamera(CameraUpdate.newLatLngZoom(
//             LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
//             13.0));
//       });
//     } catch (e) {
//       print('error $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Outlets'),
//         centerTitle: true,
//       ),
//       body: _currentLocation==null? Center(child: CircularProgressIndicator(),):
//       GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: LatLng(
//                 _currentLocation!.latitude!, _currentLocation!.longitude!),
//             zoom: 13.0,
//           ),
//           markers: _markers,
//           onMapCreated: (GoogleMapController controller) {
//             _mapController = controller;
//           }),
//     );
//   }
// }
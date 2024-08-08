import 'package:fbm_app/Pages/Donations.dart';
import 'package:fbm_app/Pages/FB_profile.dart';
import 'package:fbm_app/Pages/Food_Bank_m.dart';
import 'package:fbm_app/Pages/Homepage.dart';
import 'package:fbm_app/Pages/Inventory.dart';
import 'package:fbm_app/Pages/Outlets.dart';
import 'package:fbm_app/Pages/Restaurant/listRestaurants.dart';
import 'package:fbm_app/Pages/Volunteers.dart';
import 'package:fbm_app/Pages/leaderboard.dart';
import 'package:fbm_app/Pages/map.dart';
import 'package:fbm_app/Pages/volunteers_info.dart';
import 'package:fbm_app/Pages/wastemanagement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Homepage(),
        '/profile': (context) => const FbProfile(),
        '/map': (context) => const Maap(),
        '/leaderboard': (context) => const leaderboard(),
        '/waste': (context) => const waste(),
        '/inventory': (context) => const Inventory(),
        '/volunteers': (context) => const Volunteers(),
        '/fb_info': (context) => const Food_Bank_Management(),
        '/v_info': (context) => const volunteers_info(),
        '/mydonations': (conetxt) => const Donations(),
        '/outlets': (context) => const Outlets(),
        '/restaurants': (context) => const Restaurants(),
      },
    );
  }
}

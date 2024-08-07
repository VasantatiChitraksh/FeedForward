import 'package:fbm_app/Pages/FB_profile.dart';
import 'package:fbm_app/Pages/Homepage.dart';
import 'package:fbm_app/Pages/leaderboard.dart';
import 'package:fbm_app/Pages/map.dart';
import 'package:flutter/material.dart';
import 'package:fbm_app/pages/leaderboard.dart';
import 'package:fbm_app/pages/map.dart';

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
        '/leaderboard': (context) => const leaderboard();
      },
    );
  }
}

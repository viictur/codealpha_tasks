import 'package:flutter/material.dart';
import 'screens/intro_page.dart';

void main() => runApp(FitnessTrackerApp());

class FitnessTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,
      ),
      themeMode: ThemeMode.system,
      home: IntroPage(),
    );
  }
}

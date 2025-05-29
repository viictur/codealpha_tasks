import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(QuoteApp());

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

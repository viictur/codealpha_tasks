import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      color: const Color.fromARGB(255, 216, 218, 220),
      home: FlashcardHomePage(),
    );
  }
}

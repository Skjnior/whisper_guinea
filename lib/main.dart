import 'package:flutter/material.dart';
import 'package:whisper_guinea/screens/home_screen.dart';


void main() {
  runApp(WhisperApp());
}

class WhisperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whisper Guinea',
      theme: ThemeData(
        primaryColor: Color(0xFF34A853), // Vert principal
        hintColor: Color(0xFFFB8C00), // Orange accent
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home_Screen(),
    );
  }
}





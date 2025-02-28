import 'package:beauty_manager/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFF7CCC3),
        textTheme: GoogleFonts.kohSantepheapTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
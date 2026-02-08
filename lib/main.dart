import 'package:aiservicewebsite/mainhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.dark,

    // 1. Setting Roboto Mono as the base for the entire app

    // textTheme: GoogleFonts.robotoMonoTextTheme(
    //   ThemeData.dark().textTheme, // Base it on the dark theme
    // ).copyWith(
    //   // 2. Overriding ONLY displayLarge with your specific style
    //   displayLarge: TextStyle(
    //     fontSize: 20,
    //     color: Colors.deepOrange,
    //     letterSpacing: 2,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  ),
  home: const Mainhome(),
);

  
  }
}
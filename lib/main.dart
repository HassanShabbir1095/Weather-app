import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importing the custom HomeScreen widget

void main() {
  runApp(const MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App', // Title of the application
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        // Set up the theme for the app using Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Set the initial screen of the app
    );
  }
}
import 'package:flutter/material.dart';

import 'screens/joke_type_view.dart';

void main() {
  runApp(const JokesApp());
}

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue),
          titleLarge: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
          bodyMedium: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 4,
          titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: JokeTypeView(),
    );
  }
}
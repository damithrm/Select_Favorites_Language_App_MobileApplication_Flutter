import 'package:flutter/material.dart';
import './load_language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Language Selecter',
        theme: ThemeData(
          primaryColor: Colors.purple[900],
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: LoadLanguage());
  }
}

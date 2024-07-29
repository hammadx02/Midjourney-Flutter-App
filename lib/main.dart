import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Midjourney 🚀',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: CreatePromptScreen(),
    );
  }
}

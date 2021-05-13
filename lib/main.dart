import 'package:flutter/material.dart';
import 'package:zealth_test_application/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zealth',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFF8F8F8),
          centerTitle: true,
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
      ),
      home: Home(),
    );
  }
}

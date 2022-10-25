import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Sullu',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
        ),
        primaryColor: Colors.orange,
      ),
      home: LoginPage(),
    );
  }
}

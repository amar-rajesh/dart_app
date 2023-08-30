import 'package:dart_app/login_page.dart';
import 'package:dart_app/signup_page.dart';
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
      title: 'LOCAL HARVEST',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

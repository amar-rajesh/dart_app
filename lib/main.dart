import 'package:flutter/material.dart';
import 'Landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

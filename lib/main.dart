import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reel_app/loginPage.dart';
import 'package:reel_app/verification_screen.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Login_page(),
    );
  }
}

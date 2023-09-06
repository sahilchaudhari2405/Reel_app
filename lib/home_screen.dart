import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});
  static const String ID = "home_screen";
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("sahil"),
    );
  }
}

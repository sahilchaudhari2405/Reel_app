import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reelapp/home_screen.dart';
import 'package:reelapp/loginPage.dart';
import 'package:reelapp/verification_screen.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: Login_page.ID,
      routes: {
        Login_page.ID: (context) => Login_page(),
        verification_screen.ID: (context) => verification_screen(),
        home_screen.ID: (context) => home_screen()
      },
    );
  }
}

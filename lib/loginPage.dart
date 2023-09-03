import 'package:flutter/material.dart';
import 'package:reel_app/main.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.asset(
              "asset/images/logo.png",
            ),
            backgroundColor: Colors.transparent,
            radius: mq.width * 0.25,
          ),
          SizedBox(
            height: mq.height * 0.2,
          )
           TextField(

                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            
                            ),
                          ),
        ],
      )),
    );
  }
}

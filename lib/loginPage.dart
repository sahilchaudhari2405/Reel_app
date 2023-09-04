import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:reel_app/main.dart';
import 'package:reel_app/verification_screen.dart';

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
        children: [
          SizedBox(
            height: mq.height * 0.11,
          ),
          CircleAvatar(
            child: Image.asset(
              "asset/images/logo.png",
            ),
            backgroundColor: Colors.transparent,
            radius: mq.width * 0.25,
          ),
          SizedBox(
            height: mq.height * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => verification_screen()));
                  });
                },
                child: Container(
                  height: mq.height * 0.06,
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text("NEXT"),
                )),
          )
        ],
      )),
    );
  }
}

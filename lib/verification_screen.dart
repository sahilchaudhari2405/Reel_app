import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:reel_app/main.dart';

class verification_screen extends StatefulWidget {
  const verification_screen({super.key});

  @override
  State<verification_screen> createState() => _verification_screenState();
}

class _verification_screenState extends State<verification_screen> {
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                otpbox(),
                otpbox(),
                otpbox(),
                otpbox(),
                otpbox(),
                otpbox(),
              ],
            ),
          ),
          SizedBox(
            height: mq.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {},
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

class otpbox extends StatelessWidget {
  const otpbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 44,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2))),
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

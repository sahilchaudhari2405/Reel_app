import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reelapp/home_screen.dart';
import 'package:reelapp/loginPage.dart';
import 'package:reelapp/main.dart';

class verification_screen extends StatefulWidget {
  const verification_screen({super.key});
  static const String ID = "verification_screen";
  static String code = "";
  @override
  State<verification_screen> createState() => _verification_screenState();
}

class _verification_screenState extends State<verification_screen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: mq.height * 0.11,
            ),
            CircleAvatar(
              child: Image.asset(
                "assets/images/logo.png",
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
                  varify_box(),
                  varify_box(),
                  varify_box(),
                  varify_box(),
                  varify_box(),
                  varify_box(),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Did not get OTP"),
                TextButton(
                  onPressed: () {},
                  child: Text("Resend?"),
                )
              ],
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Login_page.verify,
                              smsCode: verification_screen.code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => home_screen()),
                          ),
                          (route) => false);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    height: mq.height * 0.06,
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text("GET START"),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

class varify_box extends StatelessWidget {
  const varify_box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mq.height * .06,
      width: mq.width * .1,
      child: TextField(
        onChanged: (value) {
          verification_screen.code += value;
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

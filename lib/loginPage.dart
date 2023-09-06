import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reelapp/main.dart';
import 'package:reelapp/verification_screen.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});
  static const String ID = "login_screen";
  static String verify = "";
  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController countryController = TextEditingController();
  var phonenumber = "";
  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        onChanged: (value) {
                          phonenumber = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ))
                    ],
                  )),
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phonenumber}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        print(e);
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Login_page.verify = verificationId;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => verification_screen()),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Container(
                    height: mq.height * 0.06,
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text("NEXT"),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

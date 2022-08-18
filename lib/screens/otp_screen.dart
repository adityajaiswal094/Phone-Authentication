import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp-page';

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  var phnNo = '';
  var otpPin = '';
  var verificationID = '';
  bool timeout = false;
  int timeLeft = 30;
  late FirebaseAuth auth;

  //
  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  // FOR RESENDING
  Future<void> verifyPhone(
    String number,
  ) async {
    //
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        showSnackBarText('Auth Completed!');
      },
      verificationFailed: (FirebaseAuthException verificationFailed) async {
        showSnackBarText('Auth Failed!');
      },
      codeSent: (verificationId, resendingToken) async {
        showSnackBarText('Code Sent!');
        setState(() {
          verificationID = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        showSnackBarText('Timeout!');
        setState(() {
          timeout = true;
        });
      },
    );
    // print(verificationID);
    // print(otpPin);
  }

  Future<void> verifyOtp() async {
    await FirebaseAuth.instance
        .signInWithCredential(
          PhoneAuthProvider.credential(
            verificationId: verificationID,
            smsCode: otpPin,
          ),
        )
        .whenComplete(
          () => Navigator.of(context).pushReplacementNamed(HomePage.routeName),
        );

    // print(verificationID);
    // print(otpPin);
  }

  @override
  Widget build(BuildContext context) {
    //
    var loginCredentials =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    phnNo = loginCredentials['phnNo'].toString();
    // print(phnNo);
    auth = loginCredentials['auth'] as FirebaseAuth;
    // print(auth);

    otpPin = loginCredentials['String'].toString();
    // print(otpPin);
    verificationID = loginCredentials['String'].toString();
    // print(verificationID);
    auth = loginCredentials['auth'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          const Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              // right: 16.0,
            ),
            child: Text(
              'Enter OTP',
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          //
          const SizedBox(
            height: 16.0,
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              'A six digit code has been sent to $phnNo',
            ),
          ),

          //
          const SizedBox(
            height: 16.0,
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text('Incorrect Number? '),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),

          //
          const SizedBox(
            height: 100.0,
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PinCodeTextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,
              pinTheme: PinTheme(
                activeColor: const Color(0xFF2C3234),
                selectedColor: const Color(0xFF2C3234),
                inactiveColor: const Color(0xFF9B9B9B),
              ),
              onChanged: (String val) {
                setState(() {
                  otpPin = val;
                });
                // print(otpPin);
              },
            ),
          ),

          //
          const SizedBox(
            height: 40.0,
          ),

          //
          // if (otpPin.length != 6)
          //   GestureDetector(
          //     onTap: () async {
          //       if (timeLeft == 0) {
          //         verifyPhone(phnNo);
          //       } else {
          //         null;
          //       }
          //     },
          //     child: Container(
          //       height: 50,
          //       width: MediaQuery.of(context).size.width,
          //       margin: const EdgeInsets.symmetric(horizontal: 20.0),
          //       decoration: BoxDecoration(
          //         color: const Color(0xFFBFFB62),
          //         borderRadius: BorderRadius.circular(30.0),
          //       ),
          //       alignment: Alignment.center,
          //       child: const Text(
          //         'Resend',
          //         style: TextStyle(fontSize: 17),
          //       ),
          //     ),
          //   ),

          //
          // const SizedBox(
          //   height: 25.0,
          // ),

          //
          // if (otpPin.length == 6)
          GestureDetector(
            onTap: () async {
              if (otpPin.length == 6) {
                verifyOtp();
              } else {
                showSnackBarText('Enter OTP correctly');
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFBFFB62),
                borderRadius: BorderRadius.circular(30.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),

          //
          const SizedBox(
            height: 15.0,
          ),

          //
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text("Didn't you receive any code?"),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        verifyPhone(phnNo);
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    // Text('$timeLeft'),
                  ],
                ),
              ],
            ),
          ),

          //
          // Container(
          //   alignment: Alignment.center,
          //   child: Text('Resend OTP in $timeLeft'),
          // ),
        ],
      ),
    );
  }
}

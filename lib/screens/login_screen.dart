import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../widgets/connect_to_account.dart';
import '../widgets/divider_or.dart';
import '../widgets/sign_up.dart';
import '../widgets/sign_in.dart';
import './otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/landing-page';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var signupStatus = false;

  // ignore: unused_field, prefer_final_fields
  var _verificationCode = '';
  // final _pinPutController = TextEditingController();

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;

  var showLoading = false;

  // late PhoneAuthCredential phoneAuthCredential;

  // ignore: prefer_final_fields
  TextEditingController _phNoController = TextEditingController();
  var countryCode = '+91';

  var otpPin = '';
  var verificationID = '';

  //
  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  //
  Future<void> verifyPhone(String number) async {
    //
    await _auth.verifyPhoneNumber(
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, top: 50.0),
                height: 40,
                width: 162,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Colors.blue,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signupStatus = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: signupStatus == false
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                        ),
                        child: const Text(
                          'Signin',
                        ),
                      ),
                    ),

                    //
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signupStatus = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: signupStatus == true
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                        ),
                        child: const Text(
                          'Signup',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //
            const SizedBox(
              height: 60.0,
            ),

            //
            if (!signupStatus) const SignInWidget(),
            if (signupStatus) const SignUpWidget(),

            //
            //
            const SizedBox(
              height: 15.0,
            ),

            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IntlPhoneField(
                controller: _phNoController,
                initialCountryCode: 'IN',
                flagsButtonMargin: const EdgeInsets.only(left: 10.0),
                showDropdownIcon: false,
                disableLengthCheck: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  hintText: 'Phone Number',
                ),
                onCountryChanged: (country) {
                  setState(() {
                    countryCode = '+${country.dialCode}';
                  });
                },
              ),
            ),

            //
            const SizedBox(
              height: 30.0,
            ),

            //
            GestureDetector(
              onTap: () {
                if (_phNoController.text.isEmpty) {
                  showSnackBarText('No number entered');
                  return;
                }
                verifyPhone(_phNoController.text);
                Navigator.of(context).pushNamed(
                  OtpScreen.routeName,
                  arguments: {
                    'phnNo': '$countryCode ${_phNoController.text}',
                    'auth': _auth,
                    'otpPin': otpPin,
                    'verificationID': verificationID,
                  },
                );
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
                  'Continue',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            //
            const SizedBox(
              height: 30.0,
            ),

            //
            const DividerOR(),

            //
            const SizedBox(
              height: 30.0,
            ),

            //
            const ConnectToAccountButton(),

            //
            const SizedBox(
              height: 20.0,
            ),

            //
            SizedBox(
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xFF2C3234),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        signupStatus = true;
                      });
                    },
                    child: Text(
                      ' Signup',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

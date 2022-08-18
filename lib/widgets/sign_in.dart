import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          //
          Text(
            'Welcome Back!!',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Lora',
              fontWeight: FontWeight.w600,
            ),
          ),

          //
          SizedBox(
            height: 60.0,
          ),

          //
          Text(
            'Please login with your phone number.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

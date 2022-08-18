import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          //
          Text(
            'Welcome to App',
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
            'Please sign up with your phone number to get registered.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

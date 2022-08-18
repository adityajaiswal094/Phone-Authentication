import 'package:flutter/material.dart';

class ConnectToAccountButton extends StatelessWidget {
  const ConnectToAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Metamask SignIn / SignUp
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Feature not supported yet.'),
              ),
            );
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE2E2E2)),
              color: const Color(0xFFF5FFF3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset(
                    'assets/images/Metamask_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),

                //
                const SizedBox(
                  width: 5.0,
                ),

                const Text(
                  'Connect to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                  ),
                ),

                const Text(
                  'Metamask',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        //
        const SizedBox(
          height: 5.0,
        ),

        // Google SignIn / SignUp
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Feature not supported yet.'),
              ),
            );
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE2E2E2)),
              color: const Color(0xFFF5FFF3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset(
                    'assets/images/Google_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),

                //
                const SizedBox(
                  width: 5.0,
                ),

                const Text(
                  'Connect to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                  ),
                ),

                const Text(
                  'Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        //
        const SizedBox(
          height: 5.0,
        ),

        // Apple SignIn / SignUp
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Feature not supported yet.'),
              ),
            );
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: const Color(0xFF100F0F),
              borderRadius: BorderRadius.circular(30.0),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset(
                    'assets/images/Apple_icon.png',
                    fit: BoxFit.cover,
                    color: const Color(0xFFE2E2E2),
                  ),
                ),

                //
                const SizedBox(
                  width: 5.0,
                ),

                const Text(
                  'Connect to ',
                  style: TextStyle(
                    color: Color(0xFFE2E2E2),
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                  ),
                ),

                const Text(
                  'Apple',
                  style: TextStyle(
                    color: Color(0xFFE2E2E2),
                    fontSize: 17,
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

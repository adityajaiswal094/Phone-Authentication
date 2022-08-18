import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            child: Divider(
              indent: 25.0,
              endIndent: 15.0,
              thickness: 1.0,
              color: Colors.grey,
            ),
          ),
          Text(
            'OR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 15.0,
              endIndent: 25.0,
              thickness: 1.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

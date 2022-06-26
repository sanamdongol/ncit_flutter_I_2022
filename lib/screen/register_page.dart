import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Welcome to ',
              style: TextStyle(color: Colors.black87, fontSize: 25),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Referly',
                    style: TextStyle(color: Colors.deepOrange)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

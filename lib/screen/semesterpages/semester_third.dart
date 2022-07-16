import 'package:flutter/material.dart';

class SemesterThirdPage extends StatefulWidget {
  const SemesterThirdPage({Key? key}) : super(key: key);

  @override
  State<SemesterThirdPage> createState() => _SemesterThirdPageState();
}

class _SemesterThirdPageState extends State<SemesterThirdPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
      home: Container(),
    );
  }
}

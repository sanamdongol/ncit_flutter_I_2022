import 'package:flutter/material.dart';

class MyGridViewPage extends StatefulWidget {
  const MyGridViewPage({Key? key}) : super(key: key);

  @override
  State<MyGridViewPage> createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> {
  var _icons = [
    Icons.ac_unit_rounded,
    Icons.access_alarm,
    Icons.face_rounded,
    Icons.wallet_giftcard_outlined,
    Icons.attach_email_rounded,
    Icons.face_sharp,
    Icons.visibility,
    Icons.vibration_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(_icons.length, (index) {
          return Center(
            child: Column(

              children: [
                Text('Count'),
                Icon(
                  _icons[index],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

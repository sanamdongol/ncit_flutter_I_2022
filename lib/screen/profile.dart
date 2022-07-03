import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String userName;

  ProfilePage(this.userName);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello there! \n" + widget.userName,
                  style: TextStyle(fontSize: 30),
                ),
                Text('helo row', style: TextStyle(fontSize: 30))
              ],
            )
          ],
        ),
      ),
    );
  }
}

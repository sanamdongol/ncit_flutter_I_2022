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
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  'assets/images/lego.jpg',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () {
                    print("Image clicked");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

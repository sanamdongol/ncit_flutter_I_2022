import 'package:dayone/screen/second_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            color: Colors.red,
            onPressed: () {
              print("access alarm clicked");
            },
            icon: Icon(Icons.access_alarm),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage("From Settings page"),
                  ),
                );
              },
              child: Text('Send Data'),
            ),
            ElevatedButton(
              onPressed: () {
                print('hello show dialog');
                showMeDialog();
              },
              child: Text('Show Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showiOSDialog();
              },
              child: Text('Show iOS Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showBottomSheet();
              },
              child: Text('Bottom Sheet'),
            )
          ],
        ),
      ),
    );
  }

  void showMeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.red,
      barrierLabel: 'Barrier label',
      builder: (BuildContext context) => AlertDialog(
        title: Text('Exit'),
        content: Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          )
        ],
      ),
    );
  }

  void showiOSDialog() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Title'),
        content: Text('Message'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
          CupertinoDialogAction(
            onPressed: () {},
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            color: Colors.deepPurple,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Column 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text("Column 2"),
                  Text("Column 3"),
                  Text("Column 4"),
                  Text("Column 5"),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:dayone/screen/home.dart';
import 'package:dayone/screen/profile.dart';
import 'package:dayone/screen/settings.dart';
import 'package:flutter/material.dart';

import 'semesterpages/semester.dart';

class DashboardPage extends StatefulWidget {
  String userName;
  String password;

  DashboardPage(this.userName, this.password);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _screens = [];
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      SettingsPage(),
      ProfilePage(widget.userName),
      MainPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text("Item 1"),
              trailing: Icon(Icons.ac_unit_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage("dgdfg", "dfgdf"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Semester"),
              trailing: Icon(Icons.ac_unit_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterPage(),
                    ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_off), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              print('===================');
              print(index);
              print('===================');
            },
          );
        },
      ),
    );
  }
}

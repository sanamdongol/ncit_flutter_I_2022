import 'package:dayone/screen/semesterpages/semester_eight.dart';
import 'package:dayone/screen/semesterpages/semester_fifth.dart';
import 'package:dayone/screen/semesterpages/semester_forth.dart';
import 'package:dayone/screen/semesterpages/semester_one.dart';
import 'package:dayone/screen/semesterpages/semester_second.dart';
import 'package:dayone/screen/semesterpages/semester_seventh.dart';
import 'package:dayone/screen/semesterpages/semester_sixth.dart';
import 'package:dayone/screen/semesterpages/semester_third.dart';
import 'package:flutter/material.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage({Key? key}) : super(key: key);

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  bool _isDarkTheme = false;

  var themeLight = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    indicatorColor: Colors.deepOrange,
    fontFamily: "Lobster",
    textTheme: TextTheme(
        headline1: TextStyle(fontSize: 40, color: Colors.deepOrangeAccent),
        headline6: TextStyle(fontSize: 30, color: Colors.green)),
  );

  var darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.amber,
      fontFamily: "Roboto");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? darkTheme : themeLight,
      home: DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Semester Tracker',
            ),
            actions: [
              Switch(
                value: _isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    _isDarkTheme = value;
                  });

                  print('Switching value ' + value.toString());
                },
              ),
            ],
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: "First", icon: Icon(Icons.filter_1_rounded)),
                Tab(text: "Second", icon: Icon(Icons.filter_2_rounded)),
                Tab(text: "Third", icon: Icon(Icons.filter_3_rounded)),
                Tab(text: "Forth", icon: Icon(Icons.filter_4_rounded)),
                Tab(text: "Fifth", icon: Icon(Icons.filter_5_rounded)),
                Tab(text: "Sixth", icon: Icon(Icons.filter_6_rounded)),
                Tab(text: "Seventh", icon: Icon(Icons.filter_7_rounded)),
                Tab(text: "Eight", icon: Icon(Icons.filter_8_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SemesterOnePage(),
              SecondSem(),
              SemesterThirdPage(),
              SemesterForthPage(),
              SemesterFifthPage(),
              SemesterSixthPage(),
              SemesterSeventhPage(),
              SemesterEightPage()
            ],
          ),
        ),
      ),
    );
  }
}

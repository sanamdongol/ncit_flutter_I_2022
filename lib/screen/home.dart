import 'package:flutter/material.dart';

import 'horizontal_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _name = [
    'Amod Mandal',
    'Anuj Adhikari',
    'Ashwin Sunuwar',
    'Bidur Prasad Pant',
    'Bishnu Bogati',
    'Iraj Babu Karki',
    'Ishan Shrestha',
    'Nisha Adhikari',
    'Prajwal Thapa',
    'Pritisha Shrestha',
    'Rishikesh Sah',
    'Roshan Aryal',
    'Sanskar Shrestha',
    'Rijan Kunwar',
    'Sudip Shrestha',
    'Rohit Paswan',
    'Sulav Adhikari',
    'Sushant Shrestha',
    'Sagat Pokharel'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HorizontalList(),
                ),
              );
            },
            child: Text(
              "Horizontal List",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _name.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(_name[index],
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

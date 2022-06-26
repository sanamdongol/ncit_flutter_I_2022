import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
                color: Colors.cyan,
                width: 160,
                child: Text(
                  'First Item',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                color: Colors.red, width: 160, child: Text('Second Item')),
            Container(
                color: Colors.amber, width: 160, child: Text('Third Item')),
            Text('Forth Item'),
            Text('Fifth Item'),
            Text('Sixth Item'),
            Text('Sixth Item'),
            Text('Sixth Item'),
            Text('Sixth Item'),
            Text('Sixth Item'),
          ],
        ),
      ),
    );
  }
}

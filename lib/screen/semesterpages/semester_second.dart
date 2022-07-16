import 'package:flutter/material.dart';

class SecondSem extends StatefulWidget {
  const SecondSem({Key? key}) : super(key: key);

  @override
  State<SecondSem> createState() => _SecondSemState();
}

class _SecondSemState extends State<SecondSem> {
  var name = ' unknowning';
  String weekend = ' Friday';
  var _isVisible = false;
  var _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello' + name),
        Text('Today is ' + weekend),
        Container(
          child: TextButton(
            onPressed: () {
              setState(() {
                name = ' World';
                weekend = ' Saturday';
                print(name);
              });
            },
            child: Text('Change State'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = true;
                  });
                },
                child: Text('Magic')),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = false;
                  });
                },
                child: Text('Another Magic')),
          ],
        ),
        Visibility(
          visible: _isVisible,
          child: Container(
            color: Colors.amber,
            padding: EdgeInsets.all(15),
            child: Text(
              'I am visible now',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Slider(
            value: _sliderValue,
            min: 0,
            max: 50,
            label: _sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
                print(_sliderValue);
              });
            }),
        Text(
          'Zooming in more',
          style: TextStyle(fontSize: _sliderValue),
        ),
      ],
    );
  }
}

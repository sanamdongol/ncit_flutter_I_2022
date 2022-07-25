
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Grade.dart';
import 'database_helper.dart';


class GradeRecord extends StatefulWidget {
  const GradeRecord({Key? key}) : super(key: key);

  @override
  State<GradeRecord> createState() => _GradeRecordState();
}

var _semName = TextEditingController();
var _semGrade = TextEditingController();
var _idController = TextEditingController();

class _GradeRecordState extends State<GradeRecord> {
  String _gradeResult = '';

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Recorder'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _idController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter id to update/delete';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter id to update/delete',
                    border: OutlineInputBorder(),
                    labelText: 'Enter id to update/delete',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _semName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Semester';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Semester',
                    border: OutlineInputBorder(),
                    labelText: 'Enter Semester',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _semGrade,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Grade';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter Grade ',
                      border: OutlineInputBorder(),
                      labelText: 'Grade'),
                ),
                Wrap(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          addGrades();
                        },
                        child: Text('Add')),
                    SizedBox(width: 10),
                    OutlinedButton(onPressed: update, child: Text('Update')),
                    SizedBox(width: 10),
                    OutlinedButton(onPressed: delete, child: Text('Delete')),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        OutlinedButton(
                            onPressed: api,
                            child: Row(
                              children: [
                                Text('API'),
                                Visibility(
                                    visible: _isLoading,
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator())),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(width: 10),
                    OutlinedButton(
                        onPressed: () async {
                          List<Grade> allGrades = await DatabaseHelper.instance
                              .getAllSemesterGrade();
                          String result = '';
                          for (Grade g in allGrades) {
                            result = result +
                                "id: " +
                                g.id.toString() +
                                " " +
                                "Semester :" +
                                g.semester +
                                " " +
                                "Grade :" +
                                g.grade +
                                "\n";
                            print("My grades: " + result + '\n');
                            setState(() {
                              _gradeResult = result;
                            });
                          }
                          print(allGrades);
                        },
                        child: Text('Read')),
                  ],
                ),
                Text(_gradeResult),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addGrades() async {
    if (_semName.text != null && _semGrade.text != null) {
      print(_semName.text + "" + _semGrade.text);
      Grade grade = Grade(semester: _semName.text, grade: _semGrade.text);
      print(_semGrade.text);
      int id = await DatabaseHelper.instance.insertGrade(grade);
      if (id != null) {
        _semName.clear();
        _semGrade.clear();
      }

      /* int id = await DatabaseHelper.instance.insertNow({
        DatabaseHelper.columnSemester: _semName.text,
        DatabaseHelper.columnSemGrade: _semGrade.text
      });*/

      print(id);
    }
  }

  void update() async {
    Grade grade = Grade(
        id: int.parse(_idController.text),
        semester: _semName.text,
        grade: _semGrade.text);
    int updatedRows = await DatabaseHelper.instance.update(grade);
    print("Updated row" + updatedRows.toString());
  }

  Future<void> api() async {
    waitForSometime();
    setState(() {
      _isLoading = true;
    });

    var dio = Dio();
    // final response = await dio.get('https://jsonplaceholder.typicode.com/albums/1');

    // https://jsonplaceholder.typicode.com/todos/1
    //  final response = await dio.get('https://api.rapidmock.com/mocks/89mEw');//one
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/');
    var abc = response.data[0]["userId"];
    var title = response.data[0]["title"];
    response.data[7]['title'];
    print('xxxxxxx');
    print(abc);
    print(title);
    print('xxxxxxx');
  }

/* if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });

      print(response.data);
      //  print(response.data['title']);
    }*/

}

Future<void> readAll() async {
  List<Grade> allGrades = await DatabaseHelper.instance.getAllSemesterGrade();
  String result = '';
  for (Grade g in allGrades) {
    result = "Semester :" + g.semester + " " + "Grade :" + g.grade;
    print("My grades: " + result + '\n');
  }
  print(allGrades);
}

void delete() async {
  int deletedId =
      await DatabaseHelper.instance.delete(int.parse(_idController.text));
  print(deletedId.toString() + " id data is deleted");
}

waitForSometime() {
  Future.delayed(
    const Duration(seconds: 10),
    () => 100,
  ).then((value) {
    print('The value is $value.'); // Prints later, after 3 seconds.
  });
  print('Waiting for a value...'); // Prints first.
  print('Waiting for a value 1...'); // Prints first.
  print('Waiting for a value 2...'); // Prints first.

  /* Future.delayed(Duration(milliseconds: 1000), () {
   print("hello waiting 10 sec");
  });*/
}

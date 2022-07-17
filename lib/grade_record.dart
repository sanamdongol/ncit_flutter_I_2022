import 'package:flutter/material.dart';

class GradeRecord extends StatefulWidget {
  const GradeRecord({Key? key}) : super(key: key);

  @override
  State<GradeRecord> createState() => _GradeRecordState();
}

class _GradeRecordState extends State<GradeRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Recorder'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter id to update/delete',
                    border: OutlineInputBorder(),
                    labelText: 'Enter id to update/delete'),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Enter Semester',
                    border: OutlineInputBorder(),
                    labelText: 'Enter Semester'),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Enter Grade',
                    border: OutlineInputBorder(),
                    labelText: 'Grade'),
              ),
              Wrap(
                spacing: 10,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        addGrade();
                      },
                      child: Text('Add')),
                  OutlinedButton(
                      onPressed: () {
                        updateGrade();
                      },
                      child: Text('Update')),
                  OutlinedButton(
                      onPressed: () {
                        readAllGrades();
                      },
                      child: Text('Read')),
                  OutlinedButton(
                      onPressed: () {
                        deleteGrade();
                      },
                      child: Text('Delete')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addGrade() {
    print('Add grade');
  }

  void updateGrade() {
    print('Update grade');
  }

  void readAllGrades() {
    print('Real All grade');
  }

  void deleteGrade() {
    print('Delete grade');
  }
}

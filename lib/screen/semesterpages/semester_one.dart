import 'package:flutter/material.dart';

class SemesterOnePage extends StatefulWidget {
  const SemesterOnePage({Key? key}) : super(key: key);

  @override
  State<SemesterOnePage> createState() => _SemesterOnePageState();
}

class _SemesterOnePageState extends State<SemesterOnePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Semester Overview',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.looks_one),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Text('Total Credit Hours: 40 \n' +
                                'Total Subjects: 6'),
                            Text('Total Sports week: 1'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(onPressed: null, child: Text('SGPA: 4')),
                        TextButton(onPressed: null, child: Text('VIEW RESULT')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Courses',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Engineering Mathematics I',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(height: 5),
                          Text('Total Chapters:100'),
                          Text('Difficulty Level: Very Hard'),
                          Text('Credit Hours: 4'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Physics',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          SizedBox(height: 5),
                          Text('Total Chapters:10'),
                          Text('Difficulty Level: Extremely Hard'),
                          Text('Credit Hours: 4'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Engineering Drawing'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Communication Technique'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Basic Electrical Engineering'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Games'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Extra Activities",
              style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
                "1. Participated in Hackathon \n 2. Samosa eating competition winner \n 3. Basketball Training \n 4. Sports week winner \n 5. Participated in Raspberry Pie Introduction")
          ],
        ),
      ),
    );
  }
}

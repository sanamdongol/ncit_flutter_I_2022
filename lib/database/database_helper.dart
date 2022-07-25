import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Grade.dart';

class DatabaseHelper {
  //db variables
  static final _databaseName = 'bachelors.db';
  static final _dbVersion = 1;

  //table thing
  static final _tableName = 'gradetable';

  //column
  static final columnId = 'id';
  static final columnSemester = '';
  static final columnSemGrade = '';

  DatabaseHelper._privateConstructor(); //ways to make singleton
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE gradetable(
    id INTEGER PRIMARY KEY,
    semester TEXT,
    grade TEXT
    )
    ''');
  }

  /*
  table value will be returned in this format
  while inserting value in table it must be converted to map type

  retrieve garda tala ko format ma aucha
  delete garda chai id pass garne as parameter
 {"_id":1,
  "name":"abc"
  }*/

  Future<int> insertGrade(Grade grade) async {
    Database db = await instance.database;
    var result = await db.insert(_tableName, grade.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //insert vako id return
    print("insert result" + result.toString());
    return result;
  }

  //returns List<Map<String, dynamic>
  Future<List<Grade>> getAllSemesterGrade() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_tableName);
    /*  print("------------");
    print(maps);
    print("------------");*/

    /* for (var v in maps) {
      print("==============");
      print(v);
      print("==============");

    }*/

    List<Grade> gradeList = [];
    for (int i = 0; i < maps.length; i++) {
      print("reading data");
      Grade grade = Grade(
          id: maps[i]['id'],
          semester: maps[i]['semester'],
          grade: maps[i]['grade']);

      gradeList.add(grade);
    }
    return gradeList;

    /*  var allSemGradeList = List.generate(maps.length, (index) {
      return Grade(
        id: maps[index]['id'],
        semester: maps[index]['semester'],
        grade: maps[index]['grade'],
      );
    });

    return allSemGradeList;*/
  }

  Future<int> update(Grade grade) async {
    Database db = await instance.database;
    var result = await db.update(_tableName, grade.toMap(),
        where: 'id=?', whereArgs: [grade.id]);
    print('update' + result.toString()); //
    return result; // return no of rows udpdated
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId=?', whereArgs: [id]);
  }
}

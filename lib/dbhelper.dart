import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  //Create instance, singleton
  DbHelper._privateConstructor();

  DbHelper instance = DbHelper._privateConstructor();

  //initialize database
  Database _database;

  Future<Database> get database => _database ??= _initializeDatabase();

  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "semesterdb");
    openDatabase(path, version: 1, onCreate: _onCreate);
  }
}

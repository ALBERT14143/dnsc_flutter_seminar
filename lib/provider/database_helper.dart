import 'dart:io';

import 'package:flutter_seminar/provider/sql/sqf_testing.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const dbName = "seminar.db";
  static const dbVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    return await initDatabase();
  }

  initDatabase() async {
    Directory dbDirectory = await getApplicationDocumentsDirectory();
    String path = join(dbDirectory.path, dbName);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: onCreate,
      onUpgrade: onUpgrade
    );
  }


  Future onCreate(Database db, int version) async {
    await db.execute(SqlTesting.createTableTesting);
  }

  Future onUpgrade(Database db, int version, int oldVersion) async {

  }
}
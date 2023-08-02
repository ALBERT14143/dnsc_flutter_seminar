import 'package:flutter_seminar/model/user.dart';
import 'package:flutter_seminar/provider/database_helper.dart';

class SqlTesting{
  static const tableTesting = "tTesting";
  static const colID = "id";
  static const colFName = "fName";
  static const colMName = "mName";
  static const colLName = "lName";
  static const colPosition = "position";

  static const createTableTesting = '''
    CREATE TABLE $tableTesting(
      $colID INTEGER PRIMARY KEY AUTOINCREMENT,
      $colFName VARCHAR(50),
      $colMName VARCHAR(50),
      $colLName VARCHAR(50),
      $colPosition VARCHAR(100)
    )
  ''';

  Future<int> create(User u) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(tableTesting, u.toMap());
  }

  Future<List<User>> read() async {
    final db = await DatabaseHelper.instance.database;
    var data = await db.query(tableTesting);
    return data.map((e) => User.fromMap(e)).toList();
  }

  Future<int> update(User u) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(tableTesting, u.toMap(), where: "$colID = ?", whereArgs: [u.id]);
  }

  Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return db.delete(tableTesting, where: "$colID = ?", whereArgs: [id]);
  }
}
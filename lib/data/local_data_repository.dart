

import 'package:test_flutter/data/app_db.dart';
import 'package:test_flutter/model/User.dart';

class LocalDataRepository{
  final AppDb db = AppDb.instance;


  Future<int> insert(User data) async {
    var appDb = await db.database;
    final id = await appDb.insert("user", data.toJson());
    return id;
  }

  Future<List<User>> getData() async {
    var appDb = await db.database;
    final result = await appDb.query("user");
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User data) async {
    final appDb = await db.database;
    final id = await appDb.update("user", data.toJson(),
        where: "id = ?",
        whereArgs: [data.id]);
    return id;
  }

  Future<int> delete(int value) async {
    final prpDb = await db.database;
    final id = await prpDb.delete("user",
        where: 'id = ?',
        whereArgs: [value]);
    return id;
  }

}
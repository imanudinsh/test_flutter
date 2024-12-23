import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDb {

  static final AppDb instance = AppDb._init();
  static Database? _database;
  AppDb._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('app.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB );
  }


  Future _createDB(Database db, int version) async {
    await db.execute("CREATE TABLE user (  id INTEGER PRIMARY KEY AUTOINCREMENT,  username TEXT,  password TEXT ,  email TEXT ,  nama TEXT )");
  }
}
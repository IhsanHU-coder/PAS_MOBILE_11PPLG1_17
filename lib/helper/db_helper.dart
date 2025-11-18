import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static const String DB_NAME = "favorite.db";
  static const String TABLE_FAV = "favorites";

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DB_NAME);

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $TABLE_FAV (
          id INTEGER PRIMARY KEY,
          title TEXT,
          image TEXT,
          price REAL
        )
      ''');
    });
  }

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(TABLE_FAV, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await database;
    return await db.query(TABLE_FAV, orderBy: "id DESC");
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(TABLE_FAV, where: "id = ?", whereArgs: [id]);
  }
}

import 'package:gg_entregas/config/database/migrations/migrations.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$filePath';
    return await openDatabase(
      path,
      version: 1,
      onUpgrade: Migrations.onUpgrade,
      onCreate: Migrations.onCreate,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

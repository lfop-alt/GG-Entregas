import 'package:gg_entregas/config/database/migrations/migration.dart';
import 'package:gg_entregas/config/database/migrations/migration_v1.dart';
import 'package:sqflite/sqflite.dart';

class Migrations {
  static final List<Migration> _all = [MigrationV1()];

  static int get currentVersion => _all.last.version;

  static Future<void> onCreate(Database db, int version) async {
    for (final migration in _all) {
      await migration.up(db);
    }
  }

  static Future<void> onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    final pendentes = _all.where((element) => element.version > oldVersion);
    for (final migration in pendentes) {
      await migration.up(db);
    }
  }
}

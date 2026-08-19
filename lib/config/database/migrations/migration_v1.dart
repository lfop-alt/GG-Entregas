import 'package:gg_entregas/config/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  int get version => 1;

  @override
  Future<void> up(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS rotas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        valor REAL NOT NULL,
        local TEXT NOT NULL,
        data_entrega INTEGER NOT NULL,
        kilometragem REAL NOT NULL,
        combustivel REAL NOT NULL,
        observacao TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    print('Tabela entregas criada com sucesso!');

    // posso colocar mais tabelas aqui, caso seja necessário
  }
}

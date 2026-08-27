import 'package:gg_entregas/config/database/database_helper.dart';
import 'package:gg_entregas/models/rotas_model.dart';

class RotaRepository {
  Future<List<Rota>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('rotas');

    if (maps.isNotEmpty) {
      return maps.map((map) => Rota.fromJson(map)).toList();
    } else {
      throw Exception('Nenhuma rota encontrada');
    }
  }

  Future<void> insert(Rota rota) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('rotas', rota.toJson());
  }

  Future<void> update(Rota rota) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'rotas',
      rota.toJson(),
      where: 'id = ?',
      whereArgs: [rota.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('rotas', where: 'id = ?', whereArgs: [id]);
  }

  Future<Rota?> getById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'rotas',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Rota.fromJson(maps.first);
    } else {
      return null;
    }
  }
}

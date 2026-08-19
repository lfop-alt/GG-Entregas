import 'package:gg_entregas/config/database/database_helper.dart';
import 'package:gg_entregas/models/rotas_model.dart';

class RotaRepository {
  Future<Rota> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('rotas');

    if (maps.isNotEmpty) {
      return Rota.fromJson(maps.first);
    } else {
      throw Exception('Nenhuma rota encontrada');
    }
  }
}

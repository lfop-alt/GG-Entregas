import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/models/rotas_model.dart';
import 'package:gg_entregas/repositories/rota_repository.dart';

final rotaProvider = AsyncNotifierProvider<RotaNotifier, List<Rota>>(
  RotaNotifier.new,
);

class RotaNotifier extends AsyncNotifier<List<Rota>> {
  late final RotaRepository _rotaRepository;

  final rotaRepositoryProvider = Provider<RotaRepository>((ref) {
    return RotaRepository();
  });

  @override
  Future<List<Rota>> build() async {
    _rotaRepository = ref.watch(rotaRepositoryProvider);
    return _rotaRepository.getAll();
  }

  Future<void> insertRota(Rota rota) async {
    await _rotaRepository.insert(rota);
    state = AsyncValue.data(await _rotaRepository.getAll());
  }

  Future<void> updateRota(Rota rota) async {
    await _rotaRepository.update(rota);
    state = AsyncValue.data(await _rotaRepository.getAll());
  }

  Future<void> deleteRota(int id) async {
    await _rotaRepository.delete(id);
    state = AsyncValue.data(await _rotaRepository.getAll());
  }

  Future<void> refreshRotas() async {
    state = const AsyncValue.loading();
    try {
      final rotas = await _rotaRepository.getAll();
      state = AsyncValue.data(rotas);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

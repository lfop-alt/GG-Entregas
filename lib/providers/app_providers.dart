import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameNotifier extends Notifier<String> {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  @override
  String build() {
    loadName();
    return '';
  }

  Future<void> loadName() async {
    final name = await _prefs.getString('name');

    if (name != null) {
      state = name;
    }
  }

  Future<void> setName(String name) async {
    await _prefs.setString('name', name);
    state = name;
  }

  Future<void> clearName() async {
    state = 'Usuário';
    await _prefs.remove('name');
  }
}

final nameProvider = NotifierProvider<NameNotifier, String>(NameNotifier.new);

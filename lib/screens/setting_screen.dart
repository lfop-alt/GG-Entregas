import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/providers/app_providers.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8),

          children: [
            ListTile(
              title: Text(
                'Geral',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text('Modo Escuro'),
              trailing: Switch(value: false, onChanged: null),
            ),

            ListTile(
              title: Text(
                'Perfil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text('Editar Nome'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // spacing: 16,
                          children: [
                            // SizedBox(height: 16),
                            Text(
                              'Editar Nome',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            FilledButton(
                              onPressed: () async {
                                ref
                                    .read(nameProvider.notifier)
                                    .setName(_nameController.text);
                                _nameController.clear();

                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

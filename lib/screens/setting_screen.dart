import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(),
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
              title: Text('Modo Escuro'),
              trailing: Switch(value: false, onChanged: null),
            ),
            ListTile(
              title: Text('Modo Escuro'),
              trailing: Switch(value: false, onChanged: null),
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
              title: Text('Modo Escuro'),
              trailing: Switch(value: false, onChanged: null),
            ),
            ListTile(
              title: Text('Modo Escuro'),
              trailing: Switch(value: false, onChanged: null),
            ),
          ],
        ),
      ),
    );
  }
}

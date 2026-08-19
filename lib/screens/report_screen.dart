import 'package:flutter/material.dart';
import 'package:gg_entregas/repositories/rota_repository.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(12),

          children: [
            Card(
              child: ListTile(
                title: Text("Extrato de Lançamentos"),
                trailing: Icon(Icons.arrow_right),
                onTap: () async {
                  final rota = await RotaRepository().getAll();

                  debugPrint('Rota: ${rota.toJson()}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

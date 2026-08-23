import 'package:flutter/material.dart';
import 'package:gg_entregas/models/rotas_model.dart';
import 'package:gg_entregas/repositories/rota_repository.dart';
import 'package:intl/intl.dart';

void showModalBottomSheetCustom(BuildContext context) {
  final valorController = TextEditingController();
  final kmController = TextEditingController();
  final localController = TextEditingController();
  final dataController = TextEditingController();
  final combustivelController = TextEditingController();
  final observacaoController = TextEditingController();

  RotaRepository rotaRepository = RotaRepository();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        spacing: 16.0,
        children: [
          Text(
            'Novo Lançamento',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: TextFormField(
                  controller: valorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: kmController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'KM',
                    border: OutlineInputBorder(),
                    hintText: 'KM Rodado',
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: localController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Local',
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: TextFormField(
                  controller: dataController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Data de Entrega',
                    border: OutlineInputBorder(),
                    hintText: 'DD-MM-AAAA',
                  ),
                ),
              ),

              Expanded(
                child: TextFormField(
                  controller: combustivelController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Combustível',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: observacaoController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Observação (Opcional)',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 16.0),
          FilledButton(
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(200, 50)),
            ),
            onPressed: () async {
              print('Estou aqui');
              final valor = valorController.text;
              final km = kmController.text;
              final local = localController.text;
              final data = dataController.text;
              final combustivel = combustivelController.text;
              final observacao = observacaoController.text;

              final dateFormated = DateFormat('dd/MM/yyyy').parse(data);

              await rotaRepository.insert(
                Rota(
                  valor: double.tryParse(valor) ?? 0.0,
                  local: local,
                  combustivel: double.tryParse(combustivel) ?? 0.0,
                  observacao: observacao,
                  dataEntrega: dateFormated,
                  kilometragem: double.tryParse(km) ?? 0.0,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              );

              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    ),
  );
}

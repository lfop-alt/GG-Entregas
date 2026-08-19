class Rota {
  final int? id;
  final double valor;
  final String local;
  final DateTime dataEntrega;
  final double kilometragem;
  final double combustivel;
  final String? observacao;
  final DateTime createdAt;
  final DateTime updatedAt;

  Rota({
    this.id,
    required this.valor,
    required this.local,
    required this.dataEntrega,
    required this.kilometragem,
    required this.combustivel,
    this.observacao,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rota.fromJson(Map<String, dynamic> json) {
    return Rota(
      id: json['id'],
      valor: (json['valor'] as num).toDouble(),
      local: json['local'],
      dataEntrega: DateTime.fromMillisecondsSinceEpoch(json['data_entrega']),
      kilometragem: (json['kilometragem'] as num).toDouble(),
      combustivel: (json['combustivel'] as num).toDouble(),
      observacao: json['observacao'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'valor': valor,
      'local': local,
      'data_entrega': dataEntrega.millisecondsSinceEpoch,
      'kilometragem': kilometragem,
      'combustivel': combustivel,
      'observacao': observacao,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }
}

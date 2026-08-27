import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/providers/rota/rota_provider.dart';
import 'package:intl/intl.dart';

class HomeScreens extends ConsumerStatefulWidget {
  const HomeScreens({super.key});

  @override
  ConsumerState<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final rotas = ref.watch(rotaProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text(
                  'Saldo liquido',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                subtitle: rotas.when(
                  data: (data) {
                    final totalValor = data.fold<double>(
                      0,
                      (sum, rota) => sum + rota.valor,
                    );
                    return Text(
                      "R\$ $totalValor",
                      style: const TextStyle(fontSize: 16),
                    );
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  error: (error, stackTrace) {
                    return const Text('Erro ao carregar dados');
                  },
                ),

                trailing: const Icon(Icons.arrow_right, size: 30),
                onTap: () {
                  // Handle saldo liquido tap
                },
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsetsGeometry.all(8),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate.fixed([
                Card(
                  child: Column(
                    spacing: 35,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.local_gas_station),
                        title: const Text('Combustível'),
                      ),
                      rotas.when(
                        data: (data) {
                          final totalCombustivel = data.fold<double>(
                            0,
                            (sum, rota) => sum + rota.combustivel,
                          );
                          return Text(
                            "R\$ $totalCombustivel",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                        loading: () {
                          return CircularProgressIndicator();
                        },
                        error: (error, stackTrace) {
                          return Text('Erro ao carregar dados');
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    spacing: 35,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.speed),
                        title: const Text('Km Rodados'),
                      ),
                      rotas.when(
                        data: (data) {
                          final totalKm = data.fold<double>(
                            0,
                            (sum, rota) => sum + rota.kilometragem,
                          );
                          return Text(
                            "$totalKm km",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                        loading: () {
                          return CircularProgressIndicator();
                        },
                        error: (error, stackTrace) {
                          return Text('Erro ao carregar dados');
                        },
                      ),
                    ],
                  ),
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Histórico'),
                      onTap: () {
                        // Handle settings tap
                      },
                    ),
                    rotas.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text('Nenhuma rota encontrada'),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final rota = data[index];
                                return ListTile(
                                  title: Text(rota.local),
                                  subtitle: Text(
                                    DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(rota.dataEntrega),
                                  ),
                                  leading: Text('${rota.kilometragem} km'),
                                  trailing: Text('R\$${rota.valor}'),
                                );
                              },
                            ),
                          );
                        }
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      error: (error, stackTrace) {
                        return const Center(
                          child: Text('Erro ao carregar dados'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
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

                subtitle: const Text(
                  'R\$ 2.476,00',
                  style: TextStyle(fontSize: 16),
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
                      Text(
                        "R\$ 1.000,00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                      Text(
                        "180 km",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text('Riacho Grande'),
                            subtitle: Text('14/08/2026'),
                            leading: Text('51km'),
                            trailing: Text('R\$290,00'),
                          ),
                          ListTile(
                            title: Text('Eldorado'),
                            subtitle: Text('13/08/2026'),
                            leading: Text('11km'),
                            trailing: Text('R\$290,00'),
                          ),
                          ListTile(
                            title: Text('Areião'),
                            subtitle: Text('11/08/2026'),
                            leading: Text('33km'),
                            trailing: Text('R\$260,00'),
                          ),
                          ListTile(
                            title: Text('Riacho Grande'),
                            subtitle: Text('15/08/2026'),
                            leading: Text('47km'),
                            trailing: Text('R\$271,00'),
                          ),
                          ListTile(
                            title: Text('Inamar'),
                            subtitle: Text('16/08/2026'),
                            leading: Text('27km'),
                            trailing: Text('R\$271,00'),
                          ),
                        ],
                      ),
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

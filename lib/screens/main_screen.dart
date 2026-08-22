import 'package:flutter/material.dart';
import 'package:gg_entregas/widgets/app_bar_home.dart';
import 'package:gg_entregas/widgets/app_bar_widget.dart';
import 'package:gg_entregas/widgets/navigationbar_floating.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return Scaffold(
      appBar: _biuldAppBar(location),
      body: child,
      bottomNavigationBar: NavigationBarFloating(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 7, 53, 65),
        label: Text('Novo Lançamento', style: TextStyle(color: Colors.white)),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: child,
          ),
        ),
        icon: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

PreferredSizeWidget _biuldAppBar(String location) {
  if (location == '/report') {
    return const AppBarWidget();
  }

  if (location == '/setting') {
    return const AppBarWidget();
  }

  return const AppBarHome();
}

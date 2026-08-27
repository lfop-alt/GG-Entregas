import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/widgets/app_bar_home.dart';
import 'package:gg_entregas/widgets/app_bar_widget.dart';
import 'package:gg_entregas/widgets/navigationbar_floating.dart';
import 'package:gg_entregas/widgets/show_modal_bottom_custom.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.path;
    return Scaffold(
      appBar: _biuldAppBar(location),
      body: child,
      bottomNavigationBar: NavigationBarFloating(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 7, 53, 65),
        label: Text('Novo Lançamento', style: TextStyle(color: Colors.white)),
        onPressed: () => showModalBottomSheetCustom(context, ref),
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

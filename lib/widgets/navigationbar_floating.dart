import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarFloating extends StatefulWidget {
  const NavigationBarFloating({super.key});

  @override
  State<NavigationBarFloating> createState() => _NavigationBarFloatingState();
}

class _NavigationBarFloatingState extends State<NavigationBarFloating> {
  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/report')) {
      return 1;
    }

    if (location.startsWith('/setting')) {
      return 2;
    }

    return 0;
  }

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Index 0: Home'),
  //   Text('Index 1: Business'),
  //   Text('Index 2: School'),
  // ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;

      case 1:
        context.go('/report');
        break;

      case 2:
        context.go('/setting');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Relatórios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuração',
        ),
      ],
      currentIndex: _selectedIndex(context),
      selectedItemColor: Color.fromARGB(255, 7, 201, 250),
      onTap: _onItemTapped,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Olá, Usuario!'),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,

      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            context.go('/'); // Navigate to the login screen
          },
        ),
      ],
      titleSpacing: 2,
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person_rounded, size: 30),
        ),
      ),

      leadingWidth: 80,
      actionsPadding: EdgeInsets.symmetric(horizontal: 5),
      toolbarHeight: 130,

      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 7, 201, 250),
              Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

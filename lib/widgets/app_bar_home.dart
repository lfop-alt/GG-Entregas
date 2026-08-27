import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/providers/app_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarHome extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  ConsumerState<AppBarHome> createState() => _AppBarHomeState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _AppBarHomeState extends ConsumerState<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return AppBar(
      title: Text('Olá, $name!'),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,

      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();

            await prefs.remove('name');

            if (context.mounted) {
              context.go('/login');
            }
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

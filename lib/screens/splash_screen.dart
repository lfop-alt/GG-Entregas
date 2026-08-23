import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void go(String route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(route);
    });
  }

  Future<void> checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String name = prefs.getString('name') ?? 'Usuário';

    if (name.isNotEmpty && name != null) {
      go('/home');
    } else {
      go('/login');
    }
  }

  @override
  initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: Colors.blue);
  }
}

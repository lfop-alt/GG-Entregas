import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  @override
  void initState() {
    super.initState();

    checkUser();
  }

  Future<void> checkUser() async {
    final name = await _prefs.getString('name');

    if (!mounted) {
      return;
    }

    if (name != null && name.trim().isNotEmpty) {
      context.go('/home');
      FlutterNativeSplash.remove();
    } else {
      context.go('/login');
      FlutterNativeSplash.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

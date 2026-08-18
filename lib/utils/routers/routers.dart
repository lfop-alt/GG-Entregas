import 'package:gg_entregas/screens/LoginScreens.dart';
import 'package:gg_entregas/screens/home_screen.dart';
import 'package:gg_entregas/screens/main_screen.dart';
import 'package:gg_entregas/screens/report_screen.dart';
import 'package:gg_entregas/screens/setting_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreens()),

    // GoRoute(path: '/home', builder: (context, state) => const HomeScreens()),
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },

      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreens(),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) => const ReportScreen(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const SettingScreen(),
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;

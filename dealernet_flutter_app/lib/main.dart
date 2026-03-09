
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'shell/app_shell.dart';

import 'screens/updateinfo_screen.dart';

// Your Drift singleton / database instance
import 'data/db.dart'; // contains: final appDb = AppDatabase();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Seed the test user (jqinstaller -> John Q. Installer / ABC Security Co.)
  await appDb.seedTestData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/app': (_) => const AppShell(), // post‑login shell
        '/updateinfo': (_) => const UpdateInfoScreen(),
  
      },
    );
  }
}
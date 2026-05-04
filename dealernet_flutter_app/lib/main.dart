import 'package:flutter/material.dart';
import 'data/db.dart';
import 'screens/login_screen.dart';
import 'shell/app_shell.dart';
import 'screens/updateinfo_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/app': (_) => const AppShell(),
        '/updateinfo': (_) => const UpdateInfoScreen(),
      },
    ); 
  }
}
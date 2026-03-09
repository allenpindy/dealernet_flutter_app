import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/walkthru_screen.dart';
import '../screens/recommend_screen.dart';
import '../screens/propose_screen.dart';
import '../screens/updateinfo_screen.dart';
import '../screens/install_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool showInstall = false;

  void _openInstall() {
    setState(() => showInstall = true);
  }

  void _closeInstall() {
    setState(() => showInstall = false);
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DealerNET'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(text: 'Walk‑Thru'),
              Tab(text: 'Recommend'),
              Tab(text: 'Propose'),
              Tab(icon: Icon(Icons.lock), text: 'Admin'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                HomeScreen(onOpenInstall: _openInstall),
                const WalkthruScreen(),
                const RecommendScreen(),
                const ProposeScreen(),
                const UpdateInfoScreen(),
              ],
            ),

            if (showInstall)
              Positioned.fill(
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: _closeInstall,
                        ),
                      ),
                      const Expanded(child: InstallScreen()),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
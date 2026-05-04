import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/walkthru_screen.dart';
import '../screens/recommend_screen.dart';
import '../screens/propose_screen.dart';
import '../screens/updateinfo_screen.dart';
import '../screens/install_screen.dart';
import '../screens/arrive_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool showInstall = false;

  int selectedProposalId = 1; // ✅ tracks which job/proposal is active

  void _openInstall(int proposalId) {
    setState(() {
      selectedProposalId = proposalId;
      showInstall = true;
    });
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
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('dealerNET'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(text: 'Arrive'),
              Tab(text: 'Walk-Thru'),
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
                const ArriveScreen(),
                const WalkthruScreen(),
                const RecommendScreen(),
                ProposeScreen(proposalId: selectedProposalId),
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
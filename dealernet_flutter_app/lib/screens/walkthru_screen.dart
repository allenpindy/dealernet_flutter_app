import 'package:flutter/material.dart';

class WalkthruScreen extends StatelessWidget {
  const WalkthruScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Walk-Thru')),
      body: const Center(child: Text('Walk-Thru goes here.')),
    );
  }
}
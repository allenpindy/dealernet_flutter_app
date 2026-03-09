import 'package:flutter/material.dart';

class ProposeScreen extends StatelessWidget {
  const ProposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Propose')),
      body: const Center(child: Text('Propose goes here.')),
    );
  }
}
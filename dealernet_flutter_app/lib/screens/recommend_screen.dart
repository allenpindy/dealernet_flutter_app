import 'package:flutter/material.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommend')),
      body: const Center(child: Text('Recommend goes here.')),
    );
  }
}
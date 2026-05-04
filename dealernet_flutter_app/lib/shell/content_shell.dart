import 'package:flutter/material.dart';

class ContentShell extends StatelessWidget {
  final Widget rightContent;
  final Widget? leftContent;

  const ContentShell({
    super.key,
    required this.rightContent,
    this.leftContent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // LEFT SIDE (20%)
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(6),
                  color: Colors.white,
                  child: leftContent ??
                      const SizedBox.shrink(), // default empty
                ),
              ),
            ],
          ),
        ),

        const VerticalDivider(width: 1),

        // RIGHT SIDE (80%)
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            alignment: Alignment.topLeft,
            child: rightContent,
          ),
        ),
      ],
    );
  }
}
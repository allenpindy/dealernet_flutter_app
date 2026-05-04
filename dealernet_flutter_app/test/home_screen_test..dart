import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealernet_flutter_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen shows schedule tile', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          onOpenInstall: (_) {},
        ),
      ),
    );

    expect(find.textContaining('8:00-12:00p'), findsOneWidget);
    expect(find.text('Knowledge Base'), findsOneWidget);
  });
}
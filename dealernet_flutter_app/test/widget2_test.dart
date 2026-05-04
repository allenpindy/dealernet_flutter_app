import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealernet_flutter_app/screens/propose_screen.dart';

void main() {
  testWidgets('ProposeScreen shows contract and signature section',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProposeScreen(proposalId: 1),
      ),
    );

    expect(find.text('Propose Contract'), findsOneWidget);
    expect(find.text('Customer Signature'), findsOneWidget);
  });
}

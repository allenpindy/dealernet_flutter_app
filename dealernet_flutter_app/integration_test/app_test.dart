import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:dealernet_flutter_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app flow: login → home → propose',
      (WidgetTester tester) async {

    // Launch the app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // ✅ Login screen appears
    expect(find.text('InstallerNET Login'), findsOneWidget);

    // Enter username
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'jqinstaller',
    );

    // Enter password
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'password123',
    );

    // Tap login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Home screen loaded
    expect(find.textContaining('Welcome'), findsOneWidget);

    // Propose tab exists
    await tester.tap(find.text('Propose'));
    await tester.pumpAndSettle();

    // Propose screen loaded
    expect(find.text('Propose Contract'), findsOneWidget);
    expect(find.text('Customer Signature'), findsOneWidget);
  });

  testWidgets('User can accept signature on Propose screen',
    (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
        find.byType(TextFormField).at(0), 'jqinstaller');
    await tester.enterText(
        find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Go to Propose tab
    await tester.tap(find.text('Propose'));
    await tester.pumpAndSettle();

    // Signature pad is present
    expect(find.byType(SfSignaturePad), findsOneWidget);

    // Tap Accept & Sign
    await tester.tap(find.text('Accept & Sign'));
    await tester.pumpAndSettle();

    // Confirmation snackbar appears
    expect(find.textContaining('Contract signed'), findsOneWidget);
  });

  testWidgets('Signature persists when switching tabs',
    (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
        find.byType(TextFormField).at(0), 'jqinstaller');
    await tester.enterText(
        find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Go to Propose
    await tester.tap(find.text('Propose'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Accept & Sign'));
    await tester.pumpAndSettle();

    // Switch tab
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Return to Propose
    await tester.tap(find.text('Propose'));
    await tester.pumpAndSettle();

    // ✅ Signature still visible
    expect(find.text('Signed'), findsOneWidget);
  });

}